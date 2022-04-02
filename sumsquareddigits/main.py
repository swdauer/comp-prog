import sys
import functools


def parseLine(line):
    spl = line.split()
    return (spl[0], int(spl[1]), int(spl[2]))


def digitsBaseB(b, i, acc):
    if i == 0:
        return acc
    elif i < b:
        acc.append(i)
        return acc
    else:
        acc.append(i % b)
        return digitsBaseB(b, i // b, acc)


def sumSquares(digits):
    return functools.reduce(lambda acc, d: acc+d**2, digits, 0)


if __name__ == "__main__":
    input()
    for line in sys.stdin:
        parsed = parseLine(line)
        digits = digitsBaseB(parsed[1], parsed[2], acc=[])
        print("{} {}".format(parsed[0], sumSquares(digits)))
