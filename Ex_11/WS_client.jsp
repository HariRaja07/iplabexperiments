<%--
    Document   : index
    Created on : 11 May, 2023, 8:18:52 PM
    Author     : frsed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Smartphone Collection</title>
    <style>
        hr {
            background-color: rgb(139, 0, 0);
            border-top-color: rgb(139, 0, 0);
            border-right-color: rgb(139, 0, 0);
            border-bottom-color: rgb(139, 0, 0);
            border-left-color: rgb(139, 0, 0);
            border-style: solid;
        }

        mt {
            font-size: 1cm;
            font-family: 'Times New Roman', Times, serif;
            color: rgb(90, 44, 255);
        }

        mt1 {
            color: brown;
        }

        p {
            font-size: 0.5cm;
            font-family: 'Times New Roman', Times, serif;
            color: rgb(60, 136, 126);
        }
    </style>
</head>
<body style="background-color: rgb(240, 201, 150);">
<hr>
<mt>Smartphone Collection</mt>
<br>
<hr>
<p>
    Welcome to the world of smartphones. Explore our collection of the latest and greatest smartphones from top brands.
    <br><br>
    Login below and discover the amazing features of smartphones!
</p>
<hr>
<form>
    <label>Brand: </label>
    <input type="text" name="n"/>
    <input type="submit" value="SUBMIT"/>
</form>
<hr/>

<%
try {
    String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    String DB_URL = "jdbc:mysql://localhost:3306/smartphones";

    // Database credentials
    String USER = "root";
    String PASS = "";

    // Set response content type
    response.setContentType("text/html");
    PrintWriter out1 = response.getWriter();

    String brand = request.getParameter("n");

    String title = "Smartphone Collection";

    if (brand != null && !brand.isEmpty()) {
        out1.println("<html>\n");
        out1.println("<head> ");
        out1.println("</head>\n");
        out1.println("<body bgcolor = \"#f0f0f0\">\n");
        out1.println("<br>");
        out1.println("<h1>Brand: " + brand + "</h1>");
        out1.println("<hr>");

        out1.println("<center><h1 >" + title + "</h1></center>");

        // Register JDBC driver
        Class.forName(JDBC_DRIVER);

        // Open a connection
        Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

        // Execute SQL query
        Statement stmt = conn.createStatement();
        String sql;
        sql = "SELECT * FROM smartphones WHERE brand = '" + brand + "'";
        ResultSet rs = stmt.executeQuery(sql);

        out1.println("<style> th, td {padding-top: 10px;padding-bottom: 20px;padding-left: 30px;padding-right: 40px;}</style>");

        out1.println("<center><div><table border='1'>");
        out1.println("<tr><td> Brand </td>'");
        out1.println("<td> Model </td>");
        out1.println("<td> OS </td>");
        out1.println("<td> Price </td></tr>");

        // Extract data from result set
        while (rs.next()) {
            // Retrieve by column name
            String brandName = rs.getString("brand");
            String model = rs.getString("model");
            String storage = rs.getString("os");
            String price = rs.getString("price");

            // Display values
            out1.println("<tr> <td>" + brandName + " </td>");
            out1.println("<td>" + model + "</td>");
            out1.println("<td>" + storage + "</td>");
            out1.println("<td >" + price + "</td>");
            out1.println("</tr> ");
        }

        out1.println("</table></div></center>");
        out1.println("<br>");
        out1.println("</body></html>");

        rs.close();
        stmt.close();
        conn.close();
    }
} catch (Exception e) {
    e.printStackTrace();
}
%>
</body>
</html>
