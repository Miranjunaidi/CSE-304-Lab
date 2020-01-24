import time
file = open("All_Final.csv","r")
file = file.read()
file = file.split("\n")
search_name = input("Enter the student name you want to get the details of")
start_time = time.time()
for i in range(1,len(file)-1):
	temp_struct = file[i].split(",")
	#print(temp_struct[1])
	if temp_struct[1] == search_name:
		print(temp_struct)
		break
print("Time taken to search name is %s seconds ---" % (time.time() - start_time))