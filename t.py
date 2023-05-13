import mysql.connector
import pandas as pd
from datetime import datetime

# Connect to MySQL database
mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="",
  database="deltastaar"
)
# Define SQL query
query = "SELECT e.emp_code AS 'EMPLOYEE CODE', e.fname AS 'FIRST NAME', e.mname AS 'MIDDLE NAME', e.lname AS 'LAST NAME', ed.designation AS 'DESIGNATION', DATE_FORMAT(e.dob, '%d-%b-%Y') AS 'DATE OF BIRTH', e.contact AS 'CONTACT', e.address AS 'ADDRESS', e.state AS 'STATE', e.pincode AS 'PINCODE', e.country AS 'COUNTRY', e.email AS 'EMAIL ID', edp.dept_name AS 'DEPARTMENT', e.blood_group AS 'BLOOD GROUP', DATE_FORMAT(e.joining_date, '%d-%b-%Y') AS 'JOINING DATE', e.aadhaar_number AS 'AADHAR NUMBER', e.salary AS 'SALARY', r.room_no as 'ROOM NUMBER', a.acc_name as 'ACCOMODATION NAME' FROM employee e JOIN employee_designation ed ON ed.id = e.designation JOIN employee_dept edp ON e.department=edp.dept_id LEFT JOIN rooms r ON e.room_id=r.id LEFT JOIN accomodation a ON a.acc_id=r.acc_id"
# Execute query and fetch results into a pandas dataframe
df = pd.read_sql(query, mydb)
# Convert DATE OF BIRTH column to datetime object and format date as "DD-MM-YYYY"
df['DATE OF BIRTH'] = pd.to_datetime(df['DATE OF BIRTH']).dt.strftime('%d-%m-%Y')
# Export dataframe to Excel file
writer = pd.ExcelWriter('output.xlsx', engine='openpyxl')
df.to_excel(writer, index=False, sheet_name='Sheet1')
# Change header row color and cell values
workbook = writer.book
worksheet = writer.sheets['Sheet1']
header = worksheet.row_dimensions[1]
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
header_cells[12].value = 'DEPARTMENT'
header_cells[13].value = 'BLOOD GROUP'
header_cells[14].value = 'JOINING DATE'
header_cells[15].value = 'AADHAR NUMBER'
header_cells[16].value = 'SALARY'
header_cells[17].value = 'ROOM NUMBER'
header_cells[18].value = 'ACCOMODATION NAME'
# Save Excel file and close writer
writer.save()
writer.close()