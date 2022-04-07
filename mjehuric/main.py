def printList(list):
    print("{} {} {} {} {}".format(*list))


if __name__ == "__main__":
    inList = [int(i) for i in input().split()]
    while inList != [1, 2, 3, 4, 5]:
        for i in range(0, len(inList)-1):
            if inList[i+1] < inList[i]:
                holder = inList[i]
                inList[i] = inList[i+1]
                inList[i+1] = holder
                printList(inList)
