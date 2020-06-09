#The following code generates an index files and clusters the student records

def hf(roll):
    hash=10
    return roll%hash 


fileoffs=[0]*10

ind=open("rollno.txt",'w')

l=[]
for i in range(0,10):
    s="file"+str(i)+'.txt'
    l.append(open(s,"w"))

f1=open('all_inputs.txt','r')

while(True):
    w=f1.readline()
    if w!='':
        x=w.split()
        p=int(x[1])
        hr=hf(p)
        l[hr].write(w+"\n")
        inpstring=str(p)+' '+str(hr)+' '+str(fileoffs[hr])
        
        ind.write(inpstring+' '*(24-len(inpstring))+"\n")
        fileoffs[hr]+=25

    else:
        for i in l:
            i.close()
        f1.close()
        break
        
ind.close()



