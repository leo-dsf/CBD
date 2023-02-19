from neo4j import GraphDatabase

class Database:
    def __init__(self, uri: str, user: str, password: str):
        self.driver = GraphDatabase.driver(uri, auth=(user, password))

    def close(self):
        """Close the driver connection"""
        self.driver.close()

    def query(self, query: str):
        """Run a query"""
        return self.driver.session().run(query).data()
    
    def insert_data(self):
        """Insert data into database"""
        self.query(
            "load csv with headers from 'file:///electric-vehicle-population-data.csv' as file\
            merge (country:Country{name:file.country, city:file.city, state:file.state, postal_code:file.postal_code})\
            merge (brand:Brand{name:file.make})\
            merge (vehicle:Vehicle{model:file.model, year:file.model_year})\
            create (vehicle)-[:EXISTS]->(country)\
            create (brand)-[:MAKES]->(vehicle)\
            create (country)-[:HAS]->(brand)"
            )
    
    def get_all_vehicles(self):
        """Get all vehicles"""
        results = self.query(
                            "match (vehicle:Vehicle)\
                            return vehicle"
                            )
        for result in results:
            print(result)
    
    def get_all_brands(self):
        """Get all brands"""
        results = self.query(
                            "match (brand:Brand)\
                            return brand"
                            )
        for result in results:
            print(result)
    
    def get_all_countries(self):
        """Get all countries"""
        results = self.query(
                            "match (country:Country)\
                            return country"
                            )
        for result in results:
            print(result)
    
    def get_all_vehicles_by_country(self, country: str):
        """Get all vehicles by country"""
        results = self.query(
                            f"match (country:Country)-[:HAS]->(brand:Brand)-[:MAKES]->(vehicle:Vehicle)\
                            where country.name = '{country}'\
                            return vehicle"
                            )
        for result in results:
            print(result)

    def get_the_20_first_vehicles_by_brand(self, brand: str):
        """Get the 20 first vehicles by brand"""
        results = self.query(
                            f"match (brand:Brand)-[:MAKES]->(vehicle:Vehicle)\
                            where brand.name = '{brand}'\
                            return vehicle\
                            limit 20"
                            )
        for result in results:
            print(result)
    
    def get_the_vehicle_ordered_by_year(self, brand: str):
        """Get the vehicle ordered by year"""
        results = self.query(
                            f"match (brand:Brand)-[:MAKES]->(vehicle:Vehicle)\
                            where brand.name = '{brand}'\
                            return vehicle\
                            order by vehicle.year"
                            )
        for result in results:
            print(result)
    
    def get_the_vehicles_by_country_and_brand(self, country: str, brand: str):
        """Get the vehicles by country and brand"""
        results = self.query(
                            f"match (country:Country)-[:HAS]->(brand:Brand)-[:MAKES]->(vehicle:Vehicle)\
                            where country.name = '{country}' and brand.name = '{brand}'\
                            return vehicle"
                            )
        for result in results:
            print(result)
    
    def get_number_of_vehicles_by_country(self):
        """Get the number of vehicles by country"""
        results = self.query(
                            "match (country:Country)-[:HAS]->(brand:Brand)-[:MAKES]->(vehicle:Vehicle)\
                            return country.name, count(vehicle) as number_of_vehicles\
                            order by number_of_vehicles desc"
                            )
        for result in results:
            print(result)
    
    def get_number_of_vehicles_by_brand(self):
        """Get the number of vehicles by brand"""
        results = self.query(
                            "match (brand:Brand)-[:MAKES]->(vehicle:Vehicle)\
                            return brand.name, count(vehicle) as number_of_vehicles\
                            order by number_of_vehicles desc"
                            )
        for result in results:
            print(result)
    
    def get_number_of_vehicles_by_country_and_brand(self):
        """Get the number of vehicles by country and brand"""
        results = self.query(
                            "match (country:Country)-[:HAS]->(brand:Brand)-[:MAKES]->(vehicle:Vehicle)\
                            return country.name, brand.name, count(vehicle) as number_of_vehicles\
                            order by number_of_vehicles desc"
                            )
        for result in results:
            print(result)
    
    def get_the_vehicles_that_exist_in_more_than_one_country(self):
        """Get the vehicles that exist in more than one country"""
        results = self.query(
                            "match (vehicle:Vehicle)-[:EXISTS]->(country:Country)\
                            with vehicle, count(country) as number_of_countries\
                            where number_of_countries > 1\
                            return vehicle"
                            )
        for result in results:
            print(result)
    
    def get_vehicles(self):
        """Get name of the vehicles and the brand"""
        results = self.query(
                            "match (brand:Brand)-[:MAKES]->(vehicle:Vehicle)\
                            return brand.name as Brand, vehicle.model as Model"
                            )
        for result in results:
            print(result)

if __name__ == "__main__":
    # Create a database object
    database = Database("bolt://localhost:7687", "neo4j", "password")

    # Insert data into database
    database.insert_data()
    
    # Get all vehicles
    database.get_all_vehicles()
    
    # Get all brands
    database.get_all_brands()

    # Get all countries
    database.get_all_countries()

    # Get all vehicles by country
    database.get_all_vehicles_by_country("King")

    # Get the 20 first vehicles by brand
    database.get_the_20_first_vehicles_by_brand("TESLA")

    # Get the vehicle ordered by year
    database.get_the_vehicle_ordered_by_year("FORD")

    # Get the vehicles by country and brand
    database.get_the_vehicles_by_country_and_brand("King", "TESLA")

    # Get the number of vehicles by country
    database.get_number_of_vehicles_by_country()

    # Get the number of vehicles by brand
    database.get_number_of_vehicles_by_brand()

    # Get the number of vehicles by country and brand
    database.get_number_of_vehicles_by_country_and_brand()

    # Get the vehicles that exist in more than one country
    database.get_the_vehicles_that_exist_in_more_than_one_country()

    # Get name of the vehicles and the brand
    database.get_vehicles()

    # Close the connection
    database.close()
