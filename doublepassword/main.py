import functools as ft
import operator as op

if __name__ == '__main__':
    ps1 = input()
    ps2 = input()
    # print(ps1)
    # print(ps2)
    m = map(lambda x, y: 1 if x == y else 2, ps1, ps2)
    print(ft.reduce(op.mul, m))
