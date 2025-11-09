package com.studentportal;

public class Course {
    private String code;
    private String name;
    private String instructor;
    private String grade;
    private int progress;

    public Course(String code, String name, String instructor, String grade, int progress) {
        this.code = code;
        this.name = name;
        this.instructor = instructor;
        this.grade = grade;
        this.progress = progress;
    }

    // Getters
    public String getCode() { return code; }
    public String getName() { return name; }
    public String getInstructor() { return instructor; }
    public String getGrade() { return grade; }
    public int getProgress() { return progress; }
}
