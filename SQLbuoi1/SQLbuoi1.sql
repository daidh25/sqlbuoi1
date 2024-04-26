CREATE DATABASE Employee
--B�i 1
-- T?o b?ng Employees
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY NOT NULL,
    FirstName NVARCHAR(250) NOT NULL,
    LastName NVARCHAR(250) NOT NULL,
    Position NVARCHAR(250) NOT NULL,
    DepartmentID INT NOT NULL,
    Salary DECIMAL(10, 3) NOT NULL
);

-- Th�m d? li?u v�o b?ng
INSERT INTO Employees (EmployeeID, FirstName, LastName, Position, DepartmentID, Salary)
VALUES 
    (1, N'??i', N'?inh', 'Manager', 101, 600.000),
    (2, N'Linh', N'Nguy?n', 'Developer', 102, 500.000),
    (3, N'M?nh', N'Tr?n', 'HR Specialist', 103, 4500.000),
    (4, N'An', N'Ng�', 'Accountant', 104, 480.000),
    (5, N'Th?o', N'L�', 'Marketing Coordinator', 105, 470.000);

SELECT * FROM Employees;


----B�i 2
---T?o m?t b?ng Departments
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName NVARCHAR(250)
);
---Th�m d? li?u
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES 
    (101, N'H? th?ng th�ng tin'),
    (102, N'Thi?t k? web'),
    (103, N'H�nh ch�nh nh�n s?');
-------Hi?n th? t�n c?a nh�n vi�n c�ng v?i t�n c?a ph�ng ban 
SELECT 
    Employees.FirstName,
    Employees.LastName,
    Departments.DepartmentName
FROM 
    Employees
INNER JOIN 
    Departments ON Employees.DepartmentID = Departments.DepartmentID;

---B�i 3
---- T?ng l??ng m?i ph�ng ban ?� chi tr?,s?p x?p gi?m
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



