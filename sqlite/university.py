import sqlite3

# Create the database and connect to it
conn = sqlite3.connect('university.db')

# Create and populate the tables with the provided data
def create_tables():
    conn.execute('''
        CREATE TABLE IF NOT EXISTS Students (
            student_id INTEGER PRIMARY KEY,
            student_name TEXT
        )
    ''')

    conn.execute('''
        CREATE TABLE IF NOT EXISTS Subjects (
            subject_name TEXT PRIMARY KEY
        )
    ''')

    conn.execute('''
        CREATE TABLE IF NOT EXISTS Examinations (
            exam_id INTEGER PRIMARY KEY,
            student_id INTEGER,
            subject_name TEXT,
            FOREIGN KEY (student_id) REFERENCES Students(student_id),
            FOREIGN KEY (subject_name) REFERENCES Subjects(subject_name)
        )
    ''')

def insert_data():
    students_data = [
        (1, 'Alice'),
        (2, 'Bob'),
        (13, 'John'),
        (6, 'Alex')
    ]
    conn.executemany('INSERT INTO Students (student_id, student_name) VALUES (?, ?)', students_data)

    subjects_data = [
        ('Math',),
        ('Physics',),
        ('Programming',)
    ]
    conn.executemany('INSERT INTO Subjects (subject_name) VALUES (?)', subjects_data)

    examinations_data = [
        (1, 1, 'Math'),
        (2, 1, 'Physics'),
        (3, 1, 'Programming'),
        (4, 2, 'Programming'),
        (5, 1, 'Physics'),
        (6, 1, 'Math'),
        (7, 13, 'Math'),
        (8, 13, 'Programming'),
        (9, 13, 'Physics'),
        (10, 2, 'Math'),
        (11, 1, 'Math'),
    ]
    conn.executemany('INSERT INTO Examinations (exam_id, student_id, subject_name) VALUES (?, ?, ?)', examinations_data)

# Call the functions to create and insert data into the tables
create_tables()
insert_data()

#  Execute the SQL query and fetch the results
cursor = conn.execute('''
    SELECT s.student_id, s.student_name, sub.subject_name, COUNT(e.subject_name) AS attended_exams
    FROM Students s
    CROSS JOIN Subjects sub
    LEFT JOIN Examinations e ON s.student_id = e.student_id AND sub.subject_name = e.subject_name
    GROUP BY s.student_id, sub.subject_name
    ORDER BY s.student_id, sub.subject_name
''')

# Fetch and print the results
results = cursor.fetchall()
print("+------------+--------------+--------------+----------------+")
print("| student_id | student_name | subject_name | attended_exams |")
print("+------------+--------------+--------------+----------------+")
for row in results:
    print("| {:<10} | {:<12} | {:<12} | {:<14} |".format(row[0], row[1], row[2], row[3]))
print("+------------+--------------+--------------+----------------+")

#  Close the connection to the database
conn.close()
