#global variables
invalid_names=[]
amount_of_valid_users = 0

import win32net, win32netcon
names=[]; resumeHandle=0
while True:
    data,_,resumeHandle=win32net.NetUserEnum(None,0,
            win32netcon.FILTER_NORMAL_ACCOUNT,resumeHandle)
    names.extend(e["name"] for e in data)
    if not resumeHandle: break
del data,resumeHandle
print(names)

with open("put_list_here.txt", 'r') as name_list:
    temp_list = name_list.readlines()
    new_list = ''.join(temp_list).splitlines()
    print(new_list)


#setting both lists lower case
for i in range(names.__len__()):
    names[i] = names[i].lower()
    
for i in range(new_list.__len__()):
    new_list[i] = new_list[i].lower()
    
invalid_names = list(set(new_list).difference(names))
print("invalid names: " + (' '.join(invalid_names)))