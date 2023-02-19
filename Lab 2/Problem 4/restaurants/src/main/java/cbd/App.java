package cbd;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Indexes;

import org.bson.Document;
import com.mongodb.MongoException;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

public class App {
    public static void main(String[] args) {
        try (MongoClient mongoClient = MongoClients.create()) {
            MongoDatabase database = mongoClient.getDatabase("mongodb");
            MongoCollection<Document> table = database.getCollection("restaurants");

            System.out.println("--------------------------Alínea a)--------------------------");

            // Find restaurants by name
            Document filter = new Document("nome", "Wendy'S");
            for (Document document : table.find(filter)) {
                System.out.println(document.toJson());
            }

            // Insert restaurants
            ArrayList<Integer> coordsList = new ArrayList<>();
            coordsList.add((int) -23.83277);
            coordsList.add((int) 90.000000);
            Document restaurant = new Document("address", new Document()
                    .append("building", "123")
                    .append("coord", coordsList)
                    .append("rua", "Rua dos Bobos")
                    .append("zipcode", "3810"))
                    .append("localidade", "Aveiro")
                    .append("gastronomia", "Thai")
                    .append("grades", new ArrayList<>())
                    .append("nome", "Tasca do Ze")
                    .append("restaurant_id", "0000001");
            table.insertOne(restaurant);

            // Update restaurants
            ArrayList<Document> grades = new ArrayList<>();
            grades.add(new Document("date", "2014-10-05").append("grade",
                    "A").append("score", 11));
            grades.add(new Document("date", "2015-10-05").append("grade",
                    "B").append("score", 17));
            table.updateOne(new Document("restaurant_id", "0000001"),
                    new Document("$set", new Document("grades", grades)));
            
            System.out.println("--------------------------Alínea b)--------------------------");

            String localidadeIndex = table.createIndex(Indexes.ascending("localidade"));
            System.out.println(String.format("Index created: %s", localidadeIndex));

            String gastronomiaIndex = table.createIndex(Indexes.ascending("gastronomia"));
            System.out.println(String.format("Index created: %s", gastronomiaIndex));

            String nomeIndex = table.createIndex(Indexes.ascending("nome"));
            System.out.println(String.format("Index created: %s", nomeIndex));

            // Test the indexes and how fast they are
            long startLocalidade = System.currentTimeMillis();
            System.out.println(table.find(new Document("localidade", "Aveiro")).first().toJson());
            long endLocalidade = System.currentTimeMillis();
            System.out.println(String.format("Time to find by localidade: %d ms", endLocalidade - startLocalidade));
            
            long startGastronomia = System.currentTimeMillis();
            System.out.println(table.find(new Document("gastronomia", "Thai")).first().toJson());
            long endGastronomia = System.currentTimeMillis();
            System.out.println(String.format("Time to find by gastronomia: %d ms", endGastronomia - startGastronomia));

            long startNome = System.currentTimeMillis();
            System.out.println(table.find(new Document("nome", "Sushi Zen")).first().toJson());
            long endNome = System.currentTimeMillis();
            System.out.println(String.format("Time to find by nome: %d ms", endNome - startNome));

            System.out.println("--------------------------Alínea c)--------------------------");
            
            // 6. Liste todos os restaurantes que tenham pelo menos um score superior a
            // 85.
            System.out.println("------------------------------1------------------------------");
            for (Document document : table.find(Filters.gt("grades.score", 85))) {
                System.out.println();
                System.out.println(document.toJson());

            }

            // 7. Encontre os restaurantes que obtiveram uma ou mais pontuações (score)
            // entre [80 e 100].
            System.out.println("------------------------------2------------------------------");
            for (Document document : table
                    .find(Filters.and(Filters.gte("grades.score", 80), Filters.lte("grades.score", 100)))) {
                System.out.println();
                System.out.println(document.toJson());
            }

            // 12. Liste o restaurant_id, o nome, a localidade e a gastronomia dos
            // restaurantes localizados em "Staten Island", "Queens", ou "Brooklyn".
            System.out.println("------------------------------3------------------------------");
            for (Document document : table.find(Filters.in("localidade", "Staten Island",
                    "Queens", "Brooklyn"))) {
                System.out.println();
                System.out.println("restaurant_id: " + document.get("restaurant_id"));
                System.out.println("nome: " + document.get("nome"));
                System.out.println("localidade: " + document.get("localidade"));
                System.out.println("gastronomia: " + document.get("gastronomia"));
            }

            // 16. Liste o restaurant_id, o nome, o endereço (address) e as coordenadas
            // geográficas (coord) dos restaurantes onde o 2º elemento da matriz de
            // coordenadas tem um valor superior a 42 e inferior ou igual a 52.
            System.out.println("------------------------------4------------------------------");
            for (Document document : table
                    .find(Filters.and(Filters.gt("address.coord.1", 42), Filters.lte("address.coord.1", 52)))) {
                System.out.println();
                System.out.println("restaurant_id: " + document.get("restaurant_id"));
                System.out.println("nome: " + document.get("nome"));
                Document address = (Document) document.get("address");
                System.out.println("address: " + address.get("building") + " " + address.get("rua") + ", "
                        + address.get("zipcode"));
                System.out.println("coord: " + address.get("coord"));
            }

            // 18. Liste nome, localidade, grade e gastronomia de todos os restaurantes
            // localizados em Brooklyn que não incluem gastronomia "American" e obtiveram
            // uma classificação (grade) "A". Deve apresentá-los por ordem decrescente de
            // gastronomia.
            System.out.println("------------------------------5------------------------------");
            for (Document document : table.find(Filters.and(Filters.eq("localidade", "Brooklyn"),
                    Filters.ne("gastronomia", "American"), Filters.eq("grades.grade", "A")))
                    .sort(new Document("gastronomia", -1))) {
                System.out.println();
                System.out.println("nome: " + document.get("nome"));
                System.out.println("localidade: " + document.get("localidade"));
                ArrayList<Document> tmp = (ArrayList<Document>) document.get("grades");
                ArrayList<String> grds = new ArrayList<>();
                for (Document grade : tmp) {
                    grds.add(grade.getString("grade"));
                }
                System.out.println("grades: " + grds);
                System.out.println("gastronomia: " + document.get("gastronomia"));
            }
            
            System.out.println("--------------------------Alínea d)--------------------------");

            // Number of localities
            System.out.println("Número de localidades distintas: " +
                    countLocalidades(table));

            // Number of restaurants by localities
            System.out.println("Número de restaurantes por localidade:");
            Map<String, Integer> map = countRestByLocalidade(table);
            map.forEach((k, v) -> {
                System.out.println(" -> " + k + " - " + v);
            });

            // Name of the restaurants
            String name = "Park";
            System.out.println("Nome de restaurantes contendo " + name + " no nome:");
            ArrayList<String> lst = getRestWithNameCloserTo(table, name);
            lst.forEach((r) -> {
                System.out.println(" -> " + r);
            });
        } catch (MongoException e) {
            e.printStackTrace();
        }
    }

    public static int countLocalidades(MongoCollection<Document> table) {
        return table.distinct("localidade", String.class).into(new ArrayList<>()).size();
    }

    public static Map<String, Integer> countRestByLocalidade(MongoCollection<Document> table) {
        Map<String, Integer> res = new HashMap<>();
        table.aggregate(
                new ArrayList<Document>() {
                    {
                        add(new Document("$group",
                                new Document("_id", "$localidade").append("count", new Document("$sum", 1))));
                    }
                }).into(new ArrayList<>()).forEach((doc) -> {
                    res.put(doc.getString("_id"), doc.getInteger("count"));
                });
        return res;
    }

    public static ArrayList<String> getRestWithNameCloserTo(MongoCollection<Document> table, String name) {
        ArrayList<String> res = new ArrayList<>();
        table.aggregate(
                new ArrayList<Document>() {
                    {
                        add(new Document("$match", new Document("nome", new Document("$regex", name))));
                        add(new Document("$group", new Document("_id", "$nome")));
                    }
                }).into(new ArrayList<>()).forEach((doc) -> {
                    res.add(doc.getString("_id"));
                });
        return res;
    }
}
