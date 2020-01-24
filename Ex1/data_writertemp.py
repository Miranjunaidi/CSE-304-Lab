import csv
import random
import string

No_of_records = 1000000

def randomString(stringLength=10):
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(stringLength))

def randomrollno(lists):
	random_num = random.choice(lists) 
	lists.remove(random_num)
	return random_num

def random_selection(lists):
	random_element = random.choice(lists)
	return random_element

roll_Nos = []
for i in range (No_of_records):
	roll_Nos.append(i)

Branches = ["Cse","ECE","Mechanical", "Electrical"]

Age = [18,19,20,21,22]

with open("Total_Students_Records.csv", "w") as csvfile:
	csv_writer = csv.writer(csvfile)
	csv_writer.writerow(["RollNo ", "Name", "Branch", "Age"])
	for i in range(No_of_records):
		row = [randomrollno(roll_Nos), randomString(), random_selection(Branches) , random.randint(17,22)]
		csv_writer.writerow(row)