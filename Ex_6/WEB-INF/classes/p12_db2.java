import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class p12_db2 extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        Connection conn = null;
        PreparedStatement pstmt = null;
        PrintWriter out = response.getWriter();
        String brand = request.getParameter("brand");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartphones", "root", "");
            String sql = "SELECT * FROM catalog WHERE Brand = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, brand);
            ResultSet rs = pstmt.executeQuery();
            // Extract data from result set
            while (rs.next()) {
                String brandName = rs.getString("Brand");
                String model = rs.getString("Model");
                double price = rs.getDouble("Price");
                String color = rs.getString("Color");
                // Display values
                out.println("<p>");
                out.println("<strong>Brand:</strong> " + brandName + "<br>");
                out.println("<strong>Model:</strong> " + model + "<br>");
                out.println("<strong>Price:</strong> $" + price + "<br>");
                out.println("<strong>Color:</strong> " + color + "<br>");
                out.println("</p>");
            }
            rs.close();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            System.out.print("Error connecting to the database: " + e);
        }
    }
}
