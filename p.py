import pymysql
import pandas as pd



# MySQL database configuration
host = 'localhost'
user = 'username'
password = 'password'
database = 'database_name'

# MySQL query
query = "SELECT e.emp_code AS 'EMPLOYEE CODE', e.fname AS 'FIRST NAME', e.mname AS 'MIDDLE NAME', e.lname AS 'LAST NAME', ed.designation AS 'DESIGNATION', e.dob AS 'DATE OF BIRTH', e.contact AS 'CONTACT', e.address AS 'ADDRESS', e.state AS 'STATE', e.pincode AS 'PINCODE', e.country AS 'COUNTRY', e.email AS 'EMAIL ID', edp.dept_name AS 'DEPARTMENT', e.blood_group AS 'BLOOD GROUP', e.joining_date AS 'JOINING DATE', e.aadhaar_number AS 'AADHAR NUMBER', e.salary AS 'SALARY', r.room_no as 'ROOM NUMBER', a.acc_name as 'ACCOMODATION NAME' FROM employee e JOIN employee_designation ed ON ed.id = e.designation JOIN employee_dept edp ON e.department=edp.dept_id LEFT JOIN rooms r ON e.room_id=r.id LEFT JOIN accomodation a ON a.acc_id=r.acc_id;"

# Connect to the MySQL database
db = pymysql.connect(host=host, user=user, password=password, database=database)

# Execute the MySQL query and store the results in a Pandas dataframe
df = pd.read_sql_query(query, db)

# Close the database connection
db.close()

# Select specific columns for the Excel file
df = df[['EMPLOYEE CODE', 'FIRST NAME', 'MIDDLE NAME', 'LAST NAME', 'DESIGNATION', 'DATE OF BIRTH', 'CONTACT', 'ADDRESS', 'STATE', 'PINCODE', 'COUNTRY', 'EMAIL ID', 'DEPARTMENT', 'BLOOD GROUP', 'JOINING DATE', 'AADHAR NUMBER', 'SALARY', 'ROOM NUMBER', 'ACCOMODATION NAME']]

# Create a new Excel workbook and worksheet
wb = Workbook()
ws = wb.active

# Set the header row and cell color
header = ws[1]
header[0].value = 'EMPLOYEE DETAILS'
header[0].font = Font(size=16, bold=True)
header[0].fill = PatternFill(start_color='FFC000', end_color='FFC000', fill_type='solid')

# Set the column header row and cell color
for col_num, column_title in enumerate(df.columns, 1):
    cell = ws.cell(row=2, column=col_num, value=column_title)
    cell.font = Font(bold=True)
    cell.fill = PatternFill(start_color='E6E6FA', end_color='E6E6FA', fill_type='solid')

# Set the cell values and formats
for row_num, values in enumerate(df.values, 3):
    for col_num, value in enumerate(values, 1):
        cell = ws.cell(row=row_num, column=col_num, value=value)
        if col_num == 6:  # If column is 'DATE OF BIRTH'
            cell.number_format = 'dd/mm/yyyy'  # Change the date format to 'dd/mm/yyyy'
        else:
            cell.number_format = '@'  # Set the cell format as text

# Set the column widths
column_widths = []
for column in df.columns:
    column_width
