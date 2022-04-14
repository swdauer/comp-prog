class Hand:
    # hand = 0 is folded hands
    # hand = 1 is a fist
    # hand = 2 is an open palm
    def __init__(self, playerNum, hand=0, prevHand=None, nextHand=None):
        self.playerNum = playerNum
        self.hand = hand
        self.prevHand = prevHand
        self.nextHand = nextHand

    def splitHand(self, circle):
        self.hand = 1
        newHand = Hand(self.playerNum, 1, self, self.nextHand)
        self.nextHand = newHand
        circle.space.append(newHand)

    def __str__(self):
        return "{},{}".format(self.playerNum, self.hand)


class CircleOfHands:
    def __init__(self, numHands):
        self.space = [Hand(i) for i in range(1, numHands+1)]
        for i in range(0, numHands):
            self.space[i].prevHand = self.space[i-1]
            self.space[i].nextHand = self.space[(i+1) % numHands]
        self.head = self.space[0]

    def __str__(self):
        output = self.head.__str__()
        curr = self.head.nextHand
        while curr is not self.head:
            output += " {}".format(curr.__str__())
            curr = curr.nextHand
        return output


if __name__ == "__main__":
    line = [int(x) for x in input().split()]
    syllables = line[0]
    circle = CircleOfHands(line[1])
    current = circle.head
    while current.nextHand is not current:
        for i in range(syllables-1):
            # print(i, current)
            current = current.nextHand
        if current.hand == 0:
            current.splitHand(circle)
        elif current.hand == 1:
            current.hand += 1
            current = current.nextHand
        else:
            # current = current.removeHand()
            current.nextHand.prevHand = current.prevHand
            current.prevHand.nextHand = current.nextHand
            current = current.nextHand

    print(current.playerNum)
