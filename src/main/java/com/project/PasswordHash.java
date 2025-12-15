package com.project;
import java.security.MessageDigest;

public class PasswordHash {

	public static String hash(String password) {
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(password.getBytes());
			byte[] bytes = md.digest();

			StringBuilder sb = new StringBuilder();
			for (byte b : bytes) {
				sb.append(String.format("%02x", b));
			}
			return sb.toString();

		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
