<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dashboard | Student Portal</title>
<link rel="stylesheet" href="style.css">
</head>
<body style="background-color: var(--bg-color);">
  <!-- Header -->
<header>
  <h1>Student Portal</h1><br>
  <nav>
    <ul>
      <li><a href="index.html">Home</a></li>
      <li><a href="about.html">About</a></li>
      <li><a href="courses.html">Courses</a></li>
      <li><a href="admission.html">Admission</a></li>
      <li><a href="faculty.html">Faculty</a></li>
      <li><a href="gallery.html">Gallery</a></li>
      <li><a href="events.html">Events</a></li>
      <li><a href="contact.html">Contact</a></li>
      <li><a href="logout">Logout</a></li>
    </ul>
  </nav>
</header>

<!-- Hero Section -->
<section class="hero">
  <!-- Profile Picture (optional static) -->
  <img src="images/profile.png" alt="Student Profile Picture" class="profile-pic">
  <h2>Welcome back, ${name}!</h2>
  <p>Your username: ${username} &nbsp;&nbsp; ${email != null && !email.isEmpty() ? '(' += email += ')' : ''}</p>
</section>

<!-- Main Content -->

 <main>
    <section class="preview">
  <h2>My Courses</h2>
  <p>Overview of your current enrolled courses and academic progress.</p>

  <div class="card-container">
    <c:forEach var="course" items="${courses}">
      <div class="card">
        <h3>${course.code} - ${course.name}</h3>
        <p>
          <strong>Instructor:</strong> ${course.instructor}<br>
          <strong>Grade:</strong> ${course.grade}<br>
          <strong>Progress:</strong> ${course.progress}% Complete
        </p>
        <div style="background: var(--border-color); height: 8px; border-radius: 4px; margin: var(--spacing-md) 0;">
          <div style="background: var(--success-color); height: 100%; width: ${course.progress}%; border-radius: 4px;"></div>
        </div>
        <a href="#" class="btn">View Course</a>
      </div>
    </c:forEach>
  </div>
</section>
    

    <section class="preview">
      <h2>Upcoming Deadlines</h2>
      <div class="card-container">
        <div class="card">
          <h3>📝 Assignment Due</h3>
          <p><strong>CS101 - Project Submission</strong><br>
          Due: September 20, 2025<br>
          Status: In Progress</p>
          <a href="#" class="btn btn-secondary">Submit Work</a>
        </div>
        
        <div class="card">
          <h3>📚 Exam Schedule</h3>
          <p><strong>BUS202 - Midterm Exam</strong><br>
          Date: October 5, 2025<br>
          Time: 2:00 PM - 4:00 PM</p>
          <a href="#" class="btn btn-secondary">Study Materials</a>
        </div>
        
        <div class="card">
          <h3>💰 Payment Due</h3>
          <p><strong>Tuition Fee Payment</strong><br>
          Due: September 25, 2025<br>
          Amount: $1,200.00</p>
          <a href="#" class="btn btn-secondary">Pay Now</a>
        </div>
      </div>
    </section>

    <section class="preview">
      <h2>Quick Access</h2>
      <div class="card-container">
        <div class="card">
          <h3>📊 Grades</h3>
          <p>View your current grades and academic performance across all courses.</p>
          <a href="#" class="btn">View Grades</a>
        </div>
        
        <div class="card">
          <h3>📅 Schedule</h3>
          <p>Check your class schedule and upcoming academic calendar events.</p>
          <a href="#" class="btn">View Schedule</a>
        </div>
        
        <div class="card">
          <h3>📚 Resources</h3>
          <p>Access library resources, study materials, and academic support services.</p>
          <a href="#" class="btn">Access Resources</a>
        </div>
        
        <div class="card">
          <h3>👥 Profile</h3>
          <p>Update your personal information, contact details, and preferences.</p>
          <a href="#" class="btn">Edit Profile</a>
        </div>
      </div>
    </section>

    <section class="preview">
      <h2>Academic Statistics</h2>
      <div class="card-container">
        <div class="card">
          <h3>📈 GPA Progress</h3>
          <p><strong>Current GPA:</strong> 3.75<br>
          <strong>Semester Goal:</strong> 3.8+<br>
          <strong>Overall Trend:</strong> ↗️ Improving</p>
        </div>
        
        <div class="card">
          <h3>⏰ Attendance</h3>
          <p><strong>Overall Attendance:</strong> 95%<br>
          <strong>This Semester:</strong> 98%<br>
          <strong>Perfect Attendance:</strong> 12 weeks</p>
        </div>
        
        <div class="card">
          <h3>🎯 Goals</h3>
          <p><strong>Courses Completed:</strong> 8/12<br>
          <strong>Credits Earned:</strong> 24/36<br>
          <strong>Graduation:</strong> On Track</p>
        </div>
      </div>
    </section>
  </main>

  <!-- Footer -->
  <footer>
    <p>© 2025 Student Portal</p>
  </footer>
  
  <script>
  async function fetchLoggedInUser() {
    try {
      const resp = await fetch('/studentPortal/getUser'); // adjust context path if different
      if (resp.status === 200) {
        const data = await resp.json();
        const nameElem = document.getElementById('userName');
        if (data && data.name) {
          nameElem.textContent = data.name;
        } else {
          nameElem.textContent = 'Student';
        }
      } else if (resp.status === 401) {
        // not logged in -> redirect to login
        window.location.href = 'login.html';
      } else {
        console.error('Unexpected response', resp.status);
      }
    } catch (err) {
      console.error('Could not fetch user', err);
    }
  }

  document.addEventListener('DOMContentLoaded', fetchLoggedInUser);

    // Simple dashboard functionality
    document.addEventListener('DOMContentLoaded', function() {
      console.log('Dashboard loaded successfully');
      
      // Add click handlers for demo purposes
      const buttons = document.querySelectorAll('.btn');
      buttons.forEach(button => {
        button.addEventListener('click', function(e) {
          if (this.textContent !== 'Logout') {
            e.preventDefault();
            alert('This feature would navigate to the respective page in a real application.');
          }
        });
      });
    });
  </script>
</body>
</html>










