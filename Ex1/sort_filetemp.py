import csv
import time
#for 1000 entries in 10 files of 100 entries each
file = open("All_Final.csv", "r")
file = file.read()
file = file.split('\n')
sorted_list = [[],[],[],[],[],[],[],[],[],[]] 
def seprate(file, sorted_list):
    for i in range(1,len(file)-1):
        temp_struct = file[i].split(",")
        temp_struct[0] = int(temp_struct[0])
        sorted_list[temp_struct[0]//100000].append(temp_struct) #Chaneg this line when chage the records

def write(sorted_list):
    for i in range(len(sorted_list)):
        with open("Sorted_File/files"+str(i) + ".csv", "w") as csvfile:
            csv_writer = csv.writer(csvfile)
            csv_writer.writerow(["RollNo ", "Name", "Branch", "Age"])
            csv_writer.writerows(sorted_list[i])

def mergeSort(sorted_list): 
    if len(sorted_list) > 1: 
        mid = len(sorted_list)//2 #Finding the mid of the sorted_listay 
        L = sorted_list[:mid] # Dividing the sorted_listay elements  
        R = sorted_list[mid:] # into 2 halves 
        mergeSort(L) # Sorting the first half 
        mergeSort(R) # Sorting the second half   
        i = j = k = 0
        while i < len(L) and j < len(R): 
            if L[i][0] < R[j][0]: 
                sorted_list[k] = L[i]
                i+=1
            else: 
                sorted_list[k] = R[j]
                j+=1
            k+=1
        while i < len(L): 
            sorted_list[k] = L[i]
            i+=1
            k+=1
        while j < len(R):
            sorted_list[k] = R[j]
            j+=1
            k+=1
    return sorted_list
start_time = time.time()
seprate(file, sorted_list)
for i in range(len(sorted_list)):
    sorted_list[i] = mergeSort(sorted_list[i])
    print("Time taken sort one 1 Mil records is %s seconds ---" % (time.time() - start_time))
write(sorted_list)