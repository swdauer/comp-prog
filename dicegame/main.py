def main():
    gunnarSum = sum(map(int, input().split()))
    emmaSum = sum(map(int, input().split()))
    if gunnarSum > emmaSum:
        print("Gunnar")
    elif emmaSum > gunnarSum:
        print("Emma")
    else:
        print("Tie")


if __name__ == "__main__":
    main()
