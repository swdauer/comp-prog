import enum


def suitIndex(char):
    for i, v in enumerate("PKHT"):
        if char == v:
            return i


def main():
    data = [[False for _ in range(13)] for _ in range(4)]
    counts = [0 for _ in range(4)]
    cards = input()
    for i in range(0, len(cards), 3):
        index = suitIndex(cards[i])
        rank = int(cards[i+1:i+3])-1
        if data[index][rank]:
            print("GRESKA")
            return
        counts[index] += 1
        data[index][rank] = True
    print("{} {} {} {}".format(
        13-counts[0], 13-counts[1], 13-counts[2], 13-counts[3]))


if __name__ == "__main__":
    main()
