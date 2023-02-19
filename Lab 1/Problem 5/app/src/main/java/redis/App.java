package redis;

import redis.clients.jedis.Jedis;

public class App {
    public static void main(String[] args) {
        // Start Jedis
        Jedis jedis = new Jedis();

        // Delete all keys
        jedis.flushAll();

        // Initialize the app
        app(jedis);

        // Close Jedis
        jedis.close();
    }

    public static void app(Jedis jedis) {
        // Menu
        while (true) {
            System.out.println();
            System.out.println("1. Add users.");
            System.out.println("2. List users.");
            System.out.println("3. Remove users.");
            System.out.println("4. Choose user.");
            System.out.println("5. Exit.");
            System.out.println();
            System.out.print("Select an option: ");
            int option = Integer.parseInt(System.console().readLine());
            switch (option) {
                case 1:
                    jedis.sadd("users", addUser());
                    break;
                case 2:
                    System.out.println(jedis.smembers("users"));
                    break;
                case 3:
                    removeUser(jedis);
                    break;
                case 4:
                    chooseUser(jedis);
                    break;
                case 5:
                    System.exit(0);
                    break;
                default:
                    System.out.println("Invalid choose!");
                    break;
            }
        }
    }

    public static String addUser() {
        System.out.print("Name: ");
        String name = System.console().readLine();
        return name;
    }

    public static void removeUser(Jedis jedis) {
        System.out.print("Name: ");
        String name = System.console().readLine();
        // Remove user
        jedis.srem("users", name);
        // Delete keys
        jedis.del(name);
        jedis.del(name + "follows");
        // Delete all the follows
        for (String user : jedis.smembers("users")) {
            jedis.srem(user + "follows", name);
        }
    }

    public static void chooseUser(Jedis jedis) {
        System.out.print("Name: ");
        String name = System.console().readLine();
        if (jedis.sismember("users", name)) {
            System.out.println("Welcome " + name);
            // Menu
            while (true) {
                System.out.println();
                System.out.println("1. Add post.");
                System.out.println("2. List posts.");
                System.out.println("3. Remove posts.");
                System.out.println("4. Follow user.");
                System.out.println("5. List following.");
                System.out.println("6. List following posts.");
                System.out.println("7. Exit.");
                System.out.println();
                System.out.print("Select an option: ");
                int option = Integer.parseInt(System.console().readLine());
                switch (option) {
                    case 1:
                        jedis.rpush(name, addPost());
                        break;
                    case 2:
                        // List posts
                        System.out.println(jedis.lrange(name, 0, -1));
                        break;
                    case 3:
                        removePost(jedis, name);
                        break;
                    case 4:
                        jedis.sadd(name + "follows", followUser());
                        break;
                    case 5:
                        System.out.println(jedis.smembers(name + "follows"));
                        break;
                    case 6:
                        System.out.println(jedis.smembers(name + "follows"));
                        System.out.print("Name: ");
                        String followName = System.console().readLine();
                        if (jedis.sismember(name + "follows", followName)) {
                            System.out.println(jedis.lrange(followName, 0, -1));
                        } else {
                            System.out.println("You don't follow this user!");
                        }
                        break;
                    case 7:
                        return;
                    default:
                        System.out.println("Invalid choose!");
                        break;
                }
            }
        } else
            System.out.println("User not found!");
    }

    public static String addPost() {
        System.out.print("Post: ");
        String post = System.console().readLine();
        return post;
    }

    public static void removePost(Jedis jedis, String name) {
        // Remove post
        System.out.print("Post: ");
        int index = Integer.parseInt(System.console().readLine()) - 1;
        jedis.lrem(name, index, jedis.lindex(name, index));
    }

    public static String followUser() {
        System.out.print("User: ");
        String user = System.console().readLine();
        return user;
    }
}