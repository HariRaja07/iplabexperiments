import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class p12_db1 extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        Connection conn = null;
        Statement stmt = null;
        PrintWriter out = response.getWriter();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartphones", "root", "");
            if (conn != null) {
                out.println("<h1>Connection successful</h1>");
            }
            stmt = conn.createStatement();
            String sql = "SELECT * FROM catalog";
            ResultSet rs = stmt.executeQuery(sql);
            // Extract data from result set
            while (rs.next()) {
                String brand = rs.getString("Brand");
                String model = rs.getString("Model");
                double price = rs.getDouble("Price");
                String color = rs.getString("Color");
                // Display values
                out.println("<p>");
                out.println("<strong>Brand:</strong> " + brand + "<br>");
                out.println("<strong>Model:</strong> " + model + "<br>");
                out.println("<strong>Price:</strong> $" + price + "<br>");
                out.println("<strong>Color:</strong> " + color + "<br>");
                out.println("</p>");
            }
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            System.out.print("Error connecting to the database: " + e);
        }
    }
}
