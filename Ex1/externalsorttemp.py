import csv
#for 1000 entries in 10 files of 100 entries each
file = open("All_Final.csv", "r")
file = file.read()
file = file.split('\n')
sorted_list = [[],[],[],[],[],[],[],[],[],[]] 
for i in range(1,len(file)-1):
	temp_struct = file[i].split(",")
	temp_struct[0] = int(temp_struct[0])
	sorted_list[temp_struct[0]//100000].append(temp_struct)

for i in range(len(sorted_list)):
	with open("Unsorted_Files/file"+str(i) + ".csv", "w") as csvfile:
		csv_writer = csv.writer(csvfile)
		csv_writer.writerow(["RollNo ", "Name", "Branch", "Age"])
		csv_writer.writerows(sorted_list[i])