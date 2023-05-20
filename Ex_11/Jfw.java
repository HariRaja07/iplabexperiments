package com.jfr;

import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

@WebService(serviceName = "Jfw")
public class Jfw extends HttpServlet {

    @WebMethod(operationName = "fetch")
    public String[][] fetch() {
        String[][] str = new String[4][4];
        String JDBC_DRIVER = "com.mysql.jdbc.Driver";
        String DB_URL = "jdbc:mysql://localhost:3306/smartphones";

        // Database credentials
        String USER = "root";
        String PASS = "";

        String title = "Smartphone Information";

        System.out.println(title);
        try {
            // Register JDBC driver
            Class.forName(JDBC_DRIVER);

            // Open a connection
            Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

            // Execute SQL query
            Statement stmt = conn.createStatement();
            String sql;
            sql = "SELECT * FROM smartphones;";
            ResultSet rs = stmt.executeQuery(sql);

            System.out.println("<style> th, td { ");
            System.out.println("padding-top: 10px;");
            System.out.println(" padding-bottom: 20px;");
            System.out.println("padding-left: 30px;");
            System.out.println("padding-right: 40px;");
            System.out.println("} </style><center><div><table border = 1 >");
            System.out.println("<tr><td> Brand </td>'");
            System.out.println("<td> Model </td>");
            System.out.println("<td> OS </td>");
            System.out.println("<td> Price </td></tr>");

            int i = 0;
            // Extract data from result set
            while (rs.next()) {
                // Retrieve by column name
                String brand = rs.getString("brand");
                String model = rs.getString("model");
                String os = rs.getString("os");
                String price = rs.getString("price");

                // Display values
                System.out.println("<tr> <td>" + brand + " </td>");
                System.out.println("<td>" + model + "</td>");
                System.out.println("<td>" + os + "</td>");
                System.out.println("<td >" + price + "</td>");
                System.out.println("</tr> ");

                int j = 0;
                str[i][j] = brand;
                str[i][j + 1] = model;
                str[i][j + 2] = os;
                str[i][j + 3] = price;
                i++;
            }
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            System.out.print("Failed to connect to the database - Error: " + e);
        }
        return str;
    }

    @WebMethod(operationName = "hello")
    public String hello(@WebParam(name = "name") String txt) {
        return "Hello " + txt + "!";
    }
}
