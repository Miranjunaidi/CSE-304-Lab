
from SearchFeature import *

from index_and_clustering import *

def add(n,roll,sec,age):
    f=open("all_inputs.txt",'a')
    
    inps=str(n)+' '+str(roll)+' '+str(sec)+' '+str(age)
    f.write(inps+"\n")
    f.close()
    f2=open("rollno.txt",'a')
    hfr_file=roll%10
    fileoffs[hfr_file]+=25
    f2.write(str(roll)+' '+str(hfr_file)+' '+str(fileoffs[hfr_file]))
    
    
    
    f1=open("file"+str(hfr_file)+".txt",'a')
    f1.write(inps)
    
    f1.close()
    f2.close()
    
    print("Added in fileno:"+str(hfr_file)+" at the end")
    
#add('johnny',1900003400,'A',16)


def remove(name,roll,sec,age):
    pp=search(roll)
    
    fileno,offset=pp[0],pp[1]

    
    
    f3=open("file"+str(fileno)+".txt",'r')
    
    cc=f3.readlines()
    
    rstring=name+' '+str(roll)+' '+sec+' '+str(age)
    print(cc.remove(rstring+' '*(25-len(rstring))+"\n"))
    f3.close()
    f4=open("file"+str(fileno)+".txt",'w')
    f4.writelines(cc)
    f4.close()

#remove('xQdVR', 503065,'C',20)
    
    

    
    
