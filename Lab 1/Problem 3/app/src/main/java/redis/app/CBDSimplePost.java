package redis;

import java.util.Set;
import redis.clients.jedis.Jedis;
 
public class CBDSimplePost {
 
	private Jedis jedis;
	public static String USERS = "users"; // Key set for users' name
	
	public CBDSimplePost() {
		this.jedis = new Jedis("localhost");
	}
 
	public void saveUser(String username) {
		jedis.sadd(USERS, username);
	}
	public Set<String> getUser() {
		return jedis.smembers(USERS);
	}
	
	public Set<String> getAllKeys() {
		return jedis.keys("*");
	}
 
	public static void main(String[] args) {
		CBDSimplePost board = new CBDSimplePost();
		// set some users
		String[] users = { "Ana", "Pedro", "Maria", "Luis" };
		for (String user: users) 
			board.saveUser(user);
		board.getAllKeys().stream().forEach(System.out::println);
		board.getUser().stream().forEach(System.out::println);
		
	}
}



