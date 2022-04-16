def numFactorsTwoAndRemainder(n):
    count = 0
    while n % 2 == 0:
        count += 1
        n //= 2
    return (count, n)


if __name__ == "__main__":
    ans = numFactorsTwoAndRemainder(int(input()))
    if ans[0] % 2 == 0:
        print("Bob")
    else:
        print("Alice")
        print(ans[1])
