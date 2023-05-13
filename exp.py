import mysql.connector
import pandas as pd
from openpyxl.styles import PatternFill

# Establish connection to MySQL database
conn = mysql.connector.connect(
  host="localhost",
  user="root",
  password="",
  database="deltastaar"
)

# # Execute query to retrieve data from table
# cursor = conn.cursor()
# query = "SELECT employee.emp_code AS 'EMPLOYEE CODE',employee.fname AS 'FIRST NAME',employee.mname AS 'MIDDLE NAME',employee.lname AS 'LAST NAME',employee_designation.designation AS 'DESIGNATION',employee.dob AS 'DATE OF BIRTH',employee.contact AS 'CONTACT',employee.address AS 'ADDRESS',employee.state AS 'STATE',employee.pincode AS 'PINCODE',employee.country AS 'COUNTRY',employee.email AS 'EMAIL ID' from employee JOIN employee_designation on employee_designation.id = employee.designation join employee_dept on employee.department=employee_dept.dept_id;"
# cursor.execute(query)

# # Fetch all rows of data
# result = cursor.fetchall()

# # Convert data to a Pandas DataFrame
# df = pd.DataFrame(result, columns=cursor.column_names)

# # Export DataFrame to Excel file
# df.to_excel("output.xlsx", index=False)

# # Close MySQL connection
# conn.close()

query = "SELECT employee.emp_code AS 'EMPLOYEE CODE', employee.fname AS 'FIRST NAME', employee.mname AS 'MIDDLE NAME', employee.lname AS 'LAST NAME', employee_designation.designation AS 'DESIGNATION', employee.dob AS 'DATE OF BIRTH', employee.contact AS 'CONTACT', employee.address AS 'ADDRESS', employee.state AS 'STATE', employee.pincode AS 'PINCODE', employee.country AS 'COUNTRY', employee.email AS 'EMAIL ID' FROM employee JOIN employee_designation ON employee_designation.id = employee.designation JOIN employee_dept ON employee.department = employee_dept.dept_id"

# Execute query and fetch results into a pandas dataframe
df = pd.read_sql(query, mydb)

# Define cell color for header row
header_fill = PatternFill(start_color='FFC7CE', end_color='FFC7CE', fill_type='solid')

# Export dataframe to Excel file
writer = pd.ExcelWriter('output.xlsx', engine='openpyxl')
df.to_excel(writer, index=False, sheet_name='Sheet1')

# Change header row color and cell values
workbook = writer.book
worksheet = writer.sheets['Sheet1']
header = worksheet.row_dimensions[1]
header.fill = header_fill
header_cells = worksheet[1]
header_cells[0].value = 'EMPLOYEE CODE'
header_cells[1].value = 'FIRST NAME'
header_cells[2].value = 'MIDDLE NAME'
header_cells[3].value = 'LAST NAME'
header_cells[4].value = 'DESIGNATION'
header_cells[5].value = 'DATE OF BIRTH'
header_cells[6].value = 'CONTACT'
header_cells[7].value = 'ADDRESS'
header_cells[8].value = 'STATE'
header_cells[9].value = 'PINCODE'
header_cells[10].value = 'COUNTRY'
header_cells[11].value = 'EMAIL ID'

# Save Excel file and close writer
writer.save()
writer.close()