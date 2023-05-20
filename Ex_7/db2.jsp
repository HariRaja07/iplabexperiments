<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Smartphones - Department Specific Marks</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        hr {
            border: none;
            border-top: 1px solid #ccc;
            margin: 20px 0;
        }
        .student-mark {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        .student-mark p {
            margin: 0;
        }
    </style>
</head>
<body>
    <h1>Smartphones - Department Specific Marks</h1>
    <hr>
    <% 
        Connection conn = null;
        Statement stmt = null;
        String department = request.getParameter("course");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/college","root", "");
            String sql = "SELECT * FROM marks WHERE Dept = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, department);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()) {
                String reg = rs.getString("RegNo");
                String name = rs.getString("Name");
                String dept = rs.getString("Dept");
                Double cgpa = rs.getDouble("CGPA");
                String sch = rs.getString("Scholarship");
    %>
    <div class="student-mark">
        <p>RegNo: <%= reg %></p>
        <p>Name: <%= name %></p>
        <p>Department: <%= dept %></p>
        <p>CGPA: <%= cgpa %></p>
        <p>Availing Scholarship: <%= sch %></p>
    </div>
    <% 
            }
            rs.close();
            pstmt.close();
            conn.close();
        } catch(Exception e) {
            out.println("Do not connect to DB - Error: " + e);
        }
    %>
</body>
</html>
