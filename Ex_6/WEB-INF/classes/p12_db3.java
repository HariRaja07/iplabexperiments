import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class p12_db3 extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        Connection conn = null;
        PreparedStatement pstmt = null;
        PrintWriter out = response.getWriter();

        // Retrieve form data
        String brand = request.getParameter("brand");
        String model = request.getParameter("model");
        double price = Double.parseDouble(request.getParameter("price"));
        String color = request.getParameter("color");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartphones", "root", "");

            String sql = "INSERT INTO catalog (Brand, Model, Price, Color) VALUES (?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, brand);
            pstmt.setString(2, model);
            pstmt.setDouble(3, price);
            pstmt.setString(4, color);

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                out.println("<h3>Smartphone added successfully!</h3>");
            } else {
                out.println("<h3>Failed to add smartphone.</h3>");
            }

            pstmt.close();
            conn.close();
        } catch (Exception e) {
            out.print("Error connecting to the database: " + e);
        }
    }
}
