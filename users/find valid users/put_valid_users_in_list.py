with open("put_list_here.txt", 'r') as name_list:
    temp_list = name_list.readlines()
    temp_string = ''.join(temp_list)
    print(temp_string.splitlines())