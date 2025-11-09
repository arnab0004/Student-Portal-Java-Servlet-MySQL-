<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Add Course | Admin Panel</title>
  <style>
    body {
      background-color: #1e1e1e;
      color: white;
      font-family: Arial, sans-serif;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      flex-direction: column;
    }
    form {
      background: #222;
      padding: 30px;
      border-radius: 10px;
      width: 400px;
      box-shadow: 0px 0px 10px #000;
    }
    input {
      width: 100%;
      padding: 8px;
      margin: 8px 0;
      border: none;
      border-radius: 5px;
    }
    button {
      width: 100%;
      padding: 10px;
      background-color: #0077b6;
      color: white;
      border: none;
      border-radius: 5px;
      font-size: 16px;
    }
    button:hover {
      background-color: #00b4d8;
    }
    a {
      color: #00b4d8;
      text-decoration: none;
      display: block;
      text-align: center;
      margin-top: 10px;
    }
  </style>
</head>
<body>
  <h2>Add New Course</h2>
  <form action="../addCourse" method="post">

    <label>Course Code:</label>
    <input type="text" name="courseCode" required>

    <label>Course Name:</label>
    <input type="text" name="courseName" required>

    <label>Instructor:</label>
    <input type="text" name="instructor" required>

    <label>Grade:</label>
    <input type="text" name="grade" required>

    <label>Progress:</label>
    <input type="text" name="progress" required>

    <button type="submit">Add Course</button>
    <a href="manage_courses.jsp">⬅ Back to Course List</a>
  </form>
</body>
</html>
