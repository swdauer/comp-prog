if __name__ == "__main__":
    line = input()
    numYs = int(line.split()[1])
    print("possible" if numYs % 2 == 0 else "impossible")
