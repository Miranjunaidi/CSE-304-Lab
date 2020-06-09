import random
from random import randint
import string

l=[]
ls=[]
la=[]
def random_string_generator_variable_size(min_size, max_size, allowed_chars):
    return ''.join(random.choice(allowed_chars) for x in range(randint(min_size, max_size)))


chars = string.ascii_letters
p=[]
for i in range(1000000):
    p.append(random_string_generator_variable_size(3, 7, chars))
    l.append(i)
    if(i<250000):
        ls.append('A')
        la.append(21)
    elif(i>=250000 and i<500000):
        ls.append('B')
        la.append(20)
    elif(i>=500000 and i<750000):
        ls.append('C')
        la.append(22)
    else:
        ls.append('D')
        la.append(19)
random.shuffle(l)
random.shuffle(la)
random.shuffle(ls)
file = open('all_inputs.txt','w')
for i in range(1000000):
    
    a=''+p[i]+' '+str(l[i])+' '+ls[i]+' '+str(la[i])
    r1=25-len(a)
    a+=' '*r1
    
    file.write(a)
    file.write('\n')
file.close()
