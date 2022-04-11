import sys


def parseCase(line):
    floatLine = [float(i) for i in line.split()]
    return [(floatLine[0], floatLine[1]), (floatLine[2], floatLine[3]), floatLine[4]]


def pNorm(pt1, pt2, p):
    return (abs(pt1[0] - pt2[0]) ** p + abs(pt1[1] - pt2[1]) ** p) ** (1/p)


if __name__ == "__main__":
    for line in sys.stdin:
        if line == "0\n":
            break
        parsedLine = parseCase(line)
        print(pNorm(parsedLine[0], parsedLine[1], parsedLine[2]))
