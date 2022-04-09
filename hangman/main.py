

if __name__ == "__main__":
    word = input()
    guesses = input()
    lettersFound = 0
    bodyParts = 0
    needed = len(word)
    for g in guesses:
        wasLetter = False
        for w in word:
            if w == g:
                wasLetter = True
                lettersFound += 1
        if not wasLetter:
            bodyParts += 1
        if lettersFound == needed:
            print("WIN")
            break
        if bodyParts == 10:
            print("LOSE")
            break
