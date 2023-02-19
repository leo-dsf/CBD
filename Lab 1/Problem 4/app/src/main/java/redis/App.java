package redis;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.params.ScanParams;
import redis.clients.jedis.resps.ScanResult;
import redis.clients.jedis.resps.Tuple;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Scanner;

public class App {
    public static void main(String[] args) {
        // Initialize the Jedis client
        Jedis jedis = new Jedis();

        // Autcomplete A)
        autocompleteA(jedis);

        // Autcomplete B)
        autocompleteB(jedis);

        // Close the connection
        jedis.close();
    }

    public static void autocompleteA(Jedis jedis) {
        try {
            // Read the file
            File file = new File("4/names.txt");
            Scanner scanner = new Scanner(file);

            // Add the names to the Redis sorted set from a file
            while (scanner.hasNextLine()) {
                String name = scanner.nextLine();
                jedis.zadd("names", 0, name);
            }

            // Close the scanner
            scanner.close();
        } catch (FileNotFoundException e) {
            // Exit the program if the file is not found
            System.out.println("File not found");
            System.exit(0);
        }

        // Autocomplete
        while (true) {
            // Get the user input
            Scanner sc = new Scanner(System.in);
            System.out.print("Search for ('Enter' for quit): ");
            String input = sc.nextLine();

            // If the user enters nothing, quit
            if (input.equals("")) {
                // Close the scanner
                sc.close();
                break;
            }

            // Get autocomplete suggestions
            ScanParams scanParams = new ScanParams();
            scanParams.match(input + "*");
            scanParams.count(10);
            String cursor = "0";
            while (true) {
                ScanResult<Tuple> scanResult = jedis.zscan("names", cursor, scanParams);
                for (Tuple tuple : scanResult.getResult()) {
                    System.out.println(tuple.getElement());
                }
                cursor = scanResult.getCursor();
                if (cursor.equals("0")) {
                    break;
                }
            }
            System.out.println();
        }
    }

    public static void autocompleteB(Jedis jedis) {
        try {
            // Read the file
            File file = new File("4/nomes-pt-2021.csv");
            Scanner scanner = new Scanner(file);

            // Add the names to the Redis sorted by frequency from a file
            while (scanner.hasNextLine()) {
                String[] input = scanner.nextLine().split(";");
                String name = input[0];
                int frequency = Integer.parseInt(input[1]);
                jedis.zadd("names", frequency, name);
            }

            // Close the scanner
            scanner.close();
        } catch (FileNotFoundException e) {
            // Exit the program if the file is not found
            System.out.println("File not found");
            System.exit(0);
        }

        // Autocomplete
        while (true) {
            // Get the user input
            Scanner sc = new Scanner(System.in);
            System.out.print("Search for ('Enter' for quit): ");
            String input = sc.nextLine();

            // If the user enters nothing, quit
            if (input.equals("")) {
                // Close the scanner
                sc.close();
                break;
            }
            // Create a list to store the results
            ArrayList<Tuple> results = new ArrayList<>();
            // Get autocomplete suggestions
            ScanParams scanParams = new ScanParams();
            scanParams.match(input + "*");
            scanParams.count(10);
            String cursor = "0";
            while (true) {
                ScanResult<Tuple> scanResult = jedis.zscan("names", cursor, scanParams);
                for (Tuple tuple : scanResult.getResult()) {
                    results.add(tuple);
                }
                // If the cursor is 0, there are no more results
                cursor = scanResult.getCursor();
                if (cursor.equals("0")) {
                    break;
                }
            }
            // Sort the array by frequency
            quickSort(results, 0, results.size() - 1);

            // Print the results
            for (Tuple tuple : results) {
                System.out.println(tuple.getElement());
            }

            // Print a blank line
            System.out.println();
        }
    }

    // Quick sort
    public static void quickSort(ArrayList<Tuple> array, int start, int end) {
        if (start < end) {
            int partitionIndex = partition(array, start, end);
            quickSort(array, start, partitionIndex - 1);
            quickSort(array, partitionIndex + 1, end);
        }
    }

    public static int partition(ArrayList<Tuple> array, int start, int end) {
        double pivot = array.get(end).getScore();
        int partitionIndex = start;
        for (int i = start; i < end; i++) {
            if (array.get(i).getScore() > pivot) {
                swap(array, i, partitionIndex);
                partitionIndex++;
            }
        }
        swap(array, partitionIndex, end);
        return partitionIndex;
    }

    public static void swap(ArrayList<Tuple> array, int i, int j) {
        Tuple temp = array.get(i);
        array.set(i, array.get(j));
        array.set(j, temp);
    }
}