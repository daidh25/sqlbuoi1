CREATE DATABASE Employee
--Bài 1
-- T?o b?ng Employees
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY NOT NULL,
    FirstName NVARCHAR(250) NOT NULL,
    LastName NVARCHAR(250) NOT NULL,
    Position NVARCHAR(250) NOT NULL,
    DepartmentID INT NOT NULL,
    Salary DECIMAL(10, 3) NOT NULL
);

-- Thêm d? li?u vào b?ng
INSERT INTO Employees (EmployeeID, FirstName, LastName, Position, DepartmentID, Salary)
VALUES 
    (1, N'??i', N'?inh', 'Manager', 101, 600.000),
    (2, N'Linh', N'Nguy?n', 'Developer', 102, 500.000),
    (3, N'M?nh', N'Tr?n', 'HR Specialist', 103, 4500.000),
    (4, N'An', N'Ngô', 'Accountant', 104, 480.000),
    (5, N'Th?o', N'Lê', 'Marketing Coordinator', 105, 470.000);

SELECT * FROM Employees;


----Bài 2
---T?o m?t b?ng Departments
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName NVARCHAR(250)
);
---Thêm d? li?u
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES 
    (101, N'H? th?ng thông tin'),
    (102, N'Thi?t k? web'),
    (103, N'Hành chính nhân s?');
-------Hi?n th? tên c?a nhân viên cùng v?i tên c?a phòng ban 
SELECT 
    Employees.FirstName,
    Employees.LastName,
    Departments.DepartmentName
FROM 
    Employees
INNER JOIN 
    Departments ON Employees.DepartmentID = Departments.DepartmentID;

---Bài 3
---- T?ng l??ng m?i phòng ban ?ã chi tr?,s?p x?p gi?m
SELECT 
    DepartmentName,
    TotalSalary
FROM 
    (SELECT 
        Departments.DepartmentName,
        SUM(Employees.Salary) AS TotalSalary
    FROM 
        Employees
    INNER JOIN 
        Departments ON Employees.DepartmentID = Departments.DepartmentID
    GROUP BY 
        Departments.DepartmentName) AS SalaryByDepartment
ORDER BY 
    TotalSalary DESC;
---Hi?n th?
SELECT TOP 1
    Departments.DepartmentName,
    SUM(Employees.Salary) AS TotalSalary
FROM 
    Employees
INNER JOIN 
    Departments ON Employees.DepartmentID = Departments.DepartmentID
GROUP BY 
    Departments.DepartmentName
ORDER BY 
    TotalSalary DESC;



