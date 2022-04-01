import functools as ft


def isVowel(c):
    if c in ['a', 'A',
             'e', 'E',
             'i', 'I',
             'o', 'O',
             'u', 'U']:
        return True
    else:
        return False


if __name__ == '__main__':
    print(ft.reduce(lambda x, y: x+1 if isVowel(y) else x, input(), 0))
