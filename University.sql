-- Create the database
-- CREATE DATABASE UniversityDB;
USE UniversityDB;
Schools Table CREATE TABLE Schools(
    SchoolId INT Auto_INCREMENT PRIMARY KEY,
    SchoolName VARCHAR(100) NOT NULL UNIQUE
);
Departments Table CREATE TABLE Departments(
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE,
    SchoolID INT NOT NULL,
    FOREIGN KEY (SchoolID) REFERENCES Schools(SchoolID)
);
-- Lectures Table
CREATE TABLE Lectures(
    LecturerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
-- Students Table
CREATE TABLE Students(
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Gender ENUM('Male', 'Female', 'Other') NOT NULL,
    DOB DATE NOT NULL,
    Email VARCHAR(100) UNIQUE,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
-- Courses Table 
CREATE TABLE Courses(
    CourseID INT AUTO_INCREMENT PRIMARY KEY,
    CourseCode VARCHAR(10) NOT NULL UNIQUE,
    CourseName VARCHAR(100) NOT NULL,
    CreditHours INT NOT NULL,
    DepartmentID INT,
    LecturerID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
    FOREIGN KEY (LecturerID) REFERENCES Lectures(LecturerID)
);
-- Enrollments Table (Many-to-Many between Students and Courses)
CREATE TABLE Enrollments(
    EnrollmentID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    Semester VARCHAR(10) NOT NULL,
    Year YEAR NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY(CourseID) REFERENCES Courses(CourseID),
    UNIQUE(StudentID, CourseID, Semester, Year)
);
-- Grades Table (1-to-1 with Enrollments)
CREATE TABLE Grades (
    EnrollmentID INT PRIMARY KEY,
    Grade CHAR(2),
    FOREIGN KEY (EnrollmentID) REFERENCES Enrollments(EnrollmentID)
);