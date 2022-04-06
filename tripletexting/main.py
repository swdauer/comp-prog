def splitThirds(line):
    wordLen = len(line) // 3
    return [line[:wordLen], line[wordLen:2*wordLen], line[2*wordLen:]]


def chooseMostCommon(letters):
    if letters[0] == letters[1] or letters[0] == letters[2]:
        return letters[0]
    else:
        return letters[1]


if __name__ == "__main__":
    words = splitThirds(input())
    print("".join(map(chooseMostCommon, zip(words[0], words[1], words[2]))))
