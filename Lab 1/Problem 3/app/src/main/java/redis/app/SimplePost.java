package redis.app;

import redis.clients.jedis.Jedis;

public class SimplePost {
    public static String USERS_KEY = "users"; // Key set for users name
    public static void main(String[] args) {
        // Initialize Jedis
        Jedis jedis = new Jedis();
        
        // Set some users
        String[] users = { "Ana", "Pedro", "Maria", "Luis" };

        // Remove if exists to avoid wrong type
        // jedis.del(USERS_KEY); 

        // Add users to the set and print the set
        for (String user : users)
            jedis.sadd(USERS_KEY, user);
        for (String user : jedis.smembers(USERS_KEY))
            System.out.println(user);

        // List
        jedis.lpush("list", users[0]);
        jedis.lpush("list", users[1]);
        jedis.lpush("list", users[2]);	
        System.out.println(jedis.lrange("list", 0, -1));

        // Hashmap
        jedis.hset("hashmap", "user1", users[0]);
        jedis.hset("hashmap", "user2", users[1]);
        jedis.hset("hashmap", "user3", users[2]);
        System.out.println(jedis.hget("hashmap", "user1"));
        System.out.println(jedis.hget("hashmap", "user2"));
        System.out.println(jedis.hget("hashmap", "user3"));
        System.out.println(jedis.hgetAll("hashmap"));

        // Close connection
        jedis.close();
    }
}
