# 🎓 Student Portal (Java Servlets + MySQL)

A full-stack **Student Management Web Application** built using **Java Servlets, JSP, and MySQL**.  
This project provides a complete platform for students and administrators to manage academic records, courses, and user data efficiently.

---

## 🚀 Features

### 👨‍🎓 Student Side
- Secure login and authentication
- Interactive dashboard with student details
- View enrolled courses, progress, and grades
- Admission and contact forms

### 🧑‍💼 Admin Side
- Admin login and dashboard
- Manage student records (add, update, delete)
- Manage course details (add, update, delete)
- MySQL database integration with CRUD operations

---

## 🛠️ Tech Stack

| Layer | Technology |
|-------|-------------|
| **Frontend** | HTML, CSS, JavaScript |
| **Backend** | Java Servlets, JSP |
| **Database** | MySQL |
| **Server** | Apache Tomcat 9.0 |
| **IDE** | Eclipse |

---

## 📂 Project Structure

StudentPortal/
┣ src/com/studentportal/
┃ ┣ LoginServlet.java
┃ ┣ RegisterServlet.java
┃ ┣ UpdateStudentServlet.java
┃ ┣ DeleteStudentServlet.java
┃ ┣ AddCourseServlet.java
┃ ┣ UpdateCourseServlet.java
┃ ┣ DeleteCourseServlet.java
┃ ┗ AdminLoginServlet.java
┣ WebContent/
┃ ┣ index.html
┃ ┣ login.html
┃ ┣ dashboard.jsp
┃ ┣ admin/
┃ ┃ ┣ admin_dashboard.jsp
┃ ┃ ┣ manage_students.jsp
┃ ┃ ┣ manage_courses.jsp
┃ ┃ ┣ edit_student.jsp
┃ ┃ ┣ edit_course.jsp
┃ ┃ ┗ add_course.jsp
┃ ┗ WEB-INF/
┃ ┗ web.xml


## 💾 Database Schema

### 🧍‍♂️ `students`
| id | username | password | name | email |
|----|-----------|-----------|------|--------|
| 1 | arnab123 | test123 | Arnab nandi | arnab@example.com |
| 2 | rinku123 | rinku123 | Rinku sen | rinku@gmail.com |

### 📚 `courses`
| id | course_code | course_name | instructor | grade | progress |
|----|--------------|--------------|-------------|--------|-----------|
| 1 | CS101 | Intro to Programming | Prof. Sarah Chen | A- | 85% |
| 2 | BUS202 | Business Management | Dr. Michael Rodriguez | B+ | 70% |

---

## ⚙️ How to Run Locally

1. Clone the repository:
   ```bash
   git clone https://github.com/arnab0004/Student-Portal-Java-Servlet-MySQL-.git
2. Import the project into Eclipse IDE as a Dynamic Web Project.

3. Configure Apache Tomcat 9.0 as your server.

4. Create a MySQL database named student_portal and import your tables.

Update your database credentials in the servlets (if needed):

Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_portal", "root", "yourpassword");
Run the project on server.

Visit:
http://localhost:8080/StudentPortal/


🧠 Author
Arnab Mondal
 🌱 Learner | 🔥 Building full-stack projects



---







