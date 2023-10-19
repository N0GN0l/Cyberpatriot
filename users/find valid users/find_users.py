import win32net, win32netcon
names=[]; resumeHandle=0
while True:
    data,_,resumeHandle=win32net.NetUserEnum(None,0,
            win32netcon.FILTER_NORMAL_ACCOUNT,resumeHandle)
    names.extend(e["name"] for e in data)
    if not resumeHandle: break
del data,resumeHandle
print(names)