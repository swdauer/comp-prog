import itertools


def letterToNum(letter):
    return ord(letter) - ord('a')


def numToLetter(num):
    return chr(num + ord('a'))


if __name__ == "__main__":
    input()
    key = map(letterToNum, reversed(input()))
    ciphertext = map(letterToNum, reversed(input()))
    output = []
    for i in ciphertext:
        nextLetter = next(key)
        output.append(numToLetter(nextLetter))
        key = itertools.chain(key, [(i-nextLetter) % 26])
    print("".join(reversed(output)))
