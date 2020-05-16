import numpy as np
import random
import string
No_of_records = 1000000

Branches = ["CSE","ECE","MEC", "ELC"]

def roll_no(roll_list):
    rand_index = np.random.randint(0,len(roll_list)-1)
    a = roll_list.pop(rand_index)
    return a
r_no = []
for i in range(No_of_records):
    r_no.append(i)

file = open("All_Uniform_records.csv" , "w" , buffering=7000)
for i in range(No_of_records):
    r = roll_no(r_no)
    r = random_num = '{0}'.format(str(r).zfill(6))
    a = np.random.randint(16, 21)
    b = np.random.choice(Branches)
    n = ''.join(random.sample(string.ascii_lowercase, 10))
    file.write(f"{r} | {n} | {b} | {a} \n")

file.close()