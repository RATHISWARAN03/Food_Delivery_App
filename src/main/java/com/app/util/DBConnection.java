package com.app.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() {
        try {
            String host = System.getenv("MYSQLHOST");
            String port = System.getenv("MYSQLPORT");
            String db   = System.getenv("MYSQLDATABASE");
            String user = System.getenv("MYSQLUSER");
            String pass = System.getenv("MYSQLPASSWORD");

          
            if (host == null || port == null || db == null || user == null || pass == null) {
                throw new RuntimeException("Database environment variables are missing");
            }

            String url = "jdbc:mysql://" + host + ":" + port + "/" + db
                    + "?useSSL=true"
                    + "&requireSSL=true"
                    + "&verifyServerCertificate=false"
                    + "&allowPublicKeyRetrieval=true";

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(url, user, pass);

            System.out.println("Database connected successfully");
            return con;

        } catch (Exception e) {
            System.err.println("Database connection failed");
            e.printStackTrace();
            return null;
        }
    }
}
