def parseCase(line):
    return [int(i) for i in line.split()]


def output(kangaroos):
    first = kangaroos[1] - kangaroos[0] - 1
    second = kangaroos[2] - kangaroos[1] - 1
    return max(first, second)


if __name__ == "__main__":
    print(output(parseCase(input())))
