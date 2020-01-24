file=open("Sorted_File/out.csv","a")
for num in range(0,10):
    for line in open("Sorted_File/files"+str(num)+".csv"):
         file.write(line)    
file.close()