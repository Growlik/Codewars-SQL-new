SELECT e.employee_id,
       e.first_name,
       e.last_name,
       d.department_name,
       e.salary as old_salary,
       e.salary*d.pct as new_salary
       from Employees e,
       (SELECT department_id,
       department_name, 
       1 + pctIncrease(department_id) pct 
       FROM departments) d
WHERE e.department_id = d.department_id
ORDER BY 1;