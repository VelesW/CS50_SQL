import sqlite3

# Connect to the SQLite database
conn = sqlite3.connect('dont-panic.db')
cursor = conn.cursor()

# Prompt the user for a password
password = input("Enter a password: ")

# Execute the SQL update statement
cursor.execute('''
    UPDATE users
    SET password = ?
    WHERE username = 'admin';
    ''', (password,))

# Commit the changes and close the connection
conn.commit()
conn.close()


# solution using cs50 library

# from cs50 import SQL

# db = SQL("sqlite:///dont-panic.db")
# password - input("Enter a password: ")
# db.execute(
#     '''
#     UPDATE "users"
#     SET "password" = ?
#     WHERE "username" = 'admin';
#     ''',
#     password
# )


# print("Hacked!")

