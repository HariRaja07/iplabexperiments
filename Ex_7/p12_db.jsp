<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Smartphones - Student Marklist</title>
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
        .marklist-link {
            display: block;
            text-align: center;
            margin-bottom: 20px;
            color: #007bff;
            text-decoration: none;
        }
        .marklist-link:hover {
            text-decoration: underline;
        }
        .form-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            margin: 0 auto;
        }
        .form-label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }
        .form-select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-bottom: 10px;
        }
        .form-submit {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            border: none;
            color: #fff;
            text-align: center;
            text-decoration: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .form-submit:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h1>Smartphones - Student Marklist</h1>
    <hr>
    <a href="db1.jsp" class="marklist-link">Display all students' marks</a>
    <hr>
    <div class="form-container">
        <h3>View Department Specific Mark Details</h3>
        <form action="db2.jsp" method="GET">
            <label for="course" class="form-label">Department</label>
            <select id="course" name="course" class="form-select">
                <option value="empty">--</option>
                <option value="CSE">COMPUTER SCIENCE AND ENGINEERING</option>
                <option value="ECE">ELECTRONICS AND COMMUNICATION ENGINEERING</option>
                <option value="MECH">MECHANICAL ENGINEERING</option>
            </select>
            <input type="submit" value="SUBMIT" class="form-submit"/>
        </form>
    </div>
</body>
</html>
