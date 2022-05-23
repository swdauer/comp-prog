# Is this just if the number is odd it's Bob and even Alice?
if __name__ == "__main__":
    ans = int(input())
    if ans % 2 == 1:
        print("Bob")
    else:
        print("Alice")
        print(1)
