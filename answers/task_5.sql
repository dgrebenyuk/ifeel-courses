-- TASK 1

-- SELECT e.*
-- FROM Employee e, Employee e2 
-- WHERE e2.id = e.chief_id 
-- and e.salary > e2.salary

-- SELECT e.* 
-- FROM Employee e
-- WHERE salary > (SELECT salary FROM Employee AS chief WHERE chief.id = e.chief_id)

-- TASK 2
 
-- SELECT e.name, e.salary 
-- FROM Employee e
-- WHERE salary = (SELECT MIN(salary) FROM Employee)

-- TASK 3

-- select d.id, d.name, COUNT(e.id) as employee_count
-- FROM Department d 
-- LEFT JOIN Employee e ON d.id = e.department_id 
-- GROUP BY d.id