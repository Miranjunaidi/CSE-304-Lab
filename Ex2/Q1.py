import sys

def ind_file_creat(file_name):
    fp = open(file_name , "r")
    ind_file = open("YOLO.txt", "w+")
    Off_fp = []
    offset = 0
    for i in fp.read().split(","):
        r_no = i.split(',')[0]
        offset += sys.getsizeof(i)
        ind_file.write(str(r_no) + " "+ str(offset) +  "\n")
    fp.close()
    return Off_fp

a = ind_file_creat("All_Final.csv")

def sort_ind_file(nameOfIndexFile):
    fp = open("nameOfIndexFile" , "r")
    content = fp.read().split()
