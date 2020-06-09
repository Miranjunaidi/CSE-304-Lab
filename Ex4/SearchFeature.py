

#Searcing rollno

def search(r):
    f=open("rollno.txt",'r')
    #Searching in Index (rollno.txt) file
    while(True):
        w=f.readline()
        if w!='':
            l=w.split()
            if r==int(l[0]):
                print("Record is present in fileno:",l[1],"at"+' '+str(l[2])+' offset')
                
                rfr=int(l[1])
                roff=int(l[2])
                
                f1=open("file"+str(l[1])+".txt",'r')
                f1.seek(int(l[2]))
                print(f1.readline())
                f1.close()
                f.close()
                break
    return [rfr,roff]
    
    
a = int(input("Enter the rollno you want to search for"))
search(a)