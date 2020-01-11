

#1) List the following details of each employee: employee number, #last name, first name, gender, and salary.

select employees.emp_no, employees.last_name,employees.first_name,employees.gender,salaries.salary 
from employees
INNER JOIN salaries on employees.emp_no = salaries.salary


#2) List employees who were hired in 1986.

select employees.emp_no, employees.last_name,employees.first_name,employees.hire_date
from employees
where hire_date BETWEEN '1986-01-01' and '1986-12-30';


#3) List the manager of each department with the following information: 
#department number(dept_manager.dept_no),
#department name(department.dept_name), 
#the manager's employee number(dept_manager.emp_no), 
#last name(employees.last_name), 
#first name(employees.first_name), 
#start (dept_manager.from_date) and 
#end (dept_manager.to_date) employment dates.


select dept_manager.emp_no,dept_manager.dept_no,employees.last_name,employees.first_name,dept_manager.from_date,dept_manager.to_date,department.dept_name
from (( dept_manager
left join employees on employees.emp_no = dept_manager.emp_no)right join department on department.dept_no = dept_manager.dept_no);

#4) List the department of each employee with the following information: 
#employee number (employees.emp_no), 
#last name (employees.last_name), 
#first name (employees.first_name), 
#and department name(department.dept_name).

select employees.emp_no,employees.last_name,employees.first_name,department.dept_name
from  ((dept_emp
left join department on dept_emp.dept_no = department.dept_no) right join employees on employees.emp_no =dept_emp.emp_no);

#5) List all employees whose first name is "Hercules" and last names begin with "B."

select employees.first_name,employees.last_name
from employees
where employees.first_name = 'Hercules'and employees.last_name LIKE 'B%';


#6) List all employees in the Sales department(department.dept_no(d007)), including their:
#employee number, last name, first name, and department name.

select employees.emp_no,employees.last_name,employees.first_name,dept_emp.dept_no,department.dept_name
from ((employees
full outer JOIN dept_emp on employees.emp_no = dept_emp.emp_no)full outer join department on department.dept_no = dept_emp.dept_no)
where department.dept_name = 'Sales';


#7) List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

select employees.emp_no,employees.last_name,employees.first_name,dept_emp.emp_no,dept_emp.dept_no,department.dept_name
from ((employees
full outer JOIN dept_emp on employees.emp_no = dept_emp.emp_no)full outer join department on department.dept_no = dept_emp.dept_no)
where department.dept_name = 'Sales' or department.dept_name = 'Development';



#8) In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select employees.last_name, count(*)
from employees
group by employees.last_name 
having count (*)>1;



 

