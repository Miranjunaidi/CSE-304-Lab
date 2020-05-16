import sys
def create_index_file(file_name):
    index_file = open("Index.csv", "w")
    a = open(file_name, "r")
    offset = 0 
    for i in range(1000000):
        line = a.readline()
        index_file.write(str(line.split('|')[0]))
        temp =  '{0}'.format(str(offset).zfill(8))
        index_file.write(str(temp))
        offset += 32
        a.seek(offset)
        index_file.write("\n" )
    a.close()
    index_file.close

# create_index_file("All_Uniform_records.csv")

def linear_search(roll_no):
    a = open("Index.csv", "r")
    seek_index = 0
    for i in range(1000000):
        line = a.readline().split()
        rno = int(line[0])
        # print(rno)
        if rno == roll_no:
            records = open("All_Uniform_records.csv", "r")
            records.seek(int(line[1]))
            print(records.read(32))
            break
        seek_index += 16
        a.seek(seek_index)
    records.close()
    a.close()

linear_search(365886)



