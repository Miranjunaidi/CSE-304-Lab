def sort_index_file():
    index_file = open("Sorted_Index.csv" , "w")
    for i in range(1000000):
        temp =  '{0}'.format(str(i).zfill(6))
        index_file.write(str(temp))
        index_file.write(" \n")
    index_file.close()
    for i in range(1000000):

        line = a.readline().split()
        rno = int(line[0])

def linear_search(roll_no, index_file_pointer):
    a = open("Index.csv", "r")
    seek_index = 0
    for i in range(1000000):
        line = a.readline().split()
        rno = int(line[0])
        # print(rno)
        if rno == roll_no:
            records = open("All_Uniform_records.csv", "r")
            records.seek(int(line[1]))
            index_file_pointer.write(str(seek_index))
            break
        seek_index += 16
        a.seek(seek_index)
    records.close()
    a.close()

def sort_index_file():
    for i in range(1000000):
        index_file = open("Sorted_Index.csv" , "w")
        index_file.write(str(i))
        index_file.write(" ")
        linear_search(i, index_file)
        index_file.write("\n")
    index_file.close()

sort_index_file()

