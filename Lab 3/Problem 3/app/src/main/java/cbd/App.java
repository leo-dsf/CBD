package cbd;

import com.datastax.driver.core.*;

public class App 
{
    public static void main( String[] args )
    {
        // Connect to the cluster
        Cluster cluster = Cluster.builder().addContactPoint("127.0.0.1").build();

        // Use cbd keyspace
        Session session = cluster.connect("cbd_103360_ex2");

        // Insert a new user
        session.execute("INSERT INTO users (username, name, email, register_timestamp) VALUES ('kking', 'Kerry King', 'kking@slayerband.com', toTimestamp(now()));");

        // Update the user
        session.execute("UPDATE users SET email = 'kking@slayer.com' WHERE username = 'kking';");
        
        // Select all users
        ResultSet results = session.execute("SELECT * FROM users");

        // Print all users
        System.out.println("Users:");
        for (Row row : results) {
            System.out.println(row);
            System.out.println();
        }

        // Select all videos that have been uploaded by Dave Mustaine
        results = session.execute("SELECT * FROM videos WHERE author = 'dmustaine' ALLOW FILTERING");

        // Print all videos by Dave Mustaine
        System.out.println("Videos by Dave Mustaine:");
        for (Row row : results) {
            System.out.println(row);
            System.out.println();
        }

        // Select all comments that have been posted by Dave Mustaine
        results = session.execute("SELECT * FROM comments WHERE author = 'dmustaine' ALLOW FILTERING");

        // Print all comments by Dave Mustaine
        System.out.println("Comments by Dave Mustaine:");
        for (Row row : results) {
            System.out.println(row);
            System.out.println();
        }

        // Search the average rating of a video and how many times it was voted
        results = session.execute("SELECT avg(rating), count(rating) FROM ratings WHERE video_id = 1 ALLOW FILTERING");

        // Print the average rating and the number of votes
        System.out.println("Average rating and number of votes:");
        for (Row row : results) {
            System.out.println(row);
            System.out.println();
        }

        // Search for the last 3 comments entered for a video
        results = session.execute("SELECT * FROM comments WHERE video_id = 7 LIMIT 3 ALLOW FILTERING");

        // Print the last 3 comments
        System.out.println("Last 3 comments:");
        for (Row row : results) {
            System.out.println(row);
            System.out.println();
        }

        // Close the session
        session.close();

        // Close the cluster
        cluster.close();
    }
}
