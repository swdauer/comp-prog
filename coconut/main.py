class Node:
    # hand = 0 is folded hands
    # hand = 1 is a fist
    # hand = 2 is an open palm
    def __init__(self, playerNum, hand=0):
        self.playerNum = playerNum
        self.hand = hand
        self.nextHand = self
        self.prevHand = self

    def addNodeAfter(self, nodeToAdd):
        nodeToAdd.nextHand = self.nextHand
        nodeToAdd.prevHand = self
        self.nextHand.prevHand = nodeToAdd
        self.nextHand = nodeToAdd

    def __str__(self):
        output = "{},{}".format(self.playerNum, self.hand)
        curr = self.nextHand
        while curr != self:
            output += " {},{}".format(curr.playerNum, curr.hand)
            curr = curr.nextHand
        return output

    def removeNode(self):
        self.nextHand.prevHand = self.prevHand
        self.prevHand.nextHand = self.nextHand
        return self.nextHand


def constructNSizeList(n):
    head = Node(1)
    for i in reversed(range(2, n+1)):
        head.addNodeAfter(Node(i))
    return head


# I'll maintain a circular, double-linked list of hands in the circle
if __name__ == "__main__":
    inList = [int(i) for i in input().split()]
    syllables = inList[0]
    curr = constructNSizeList(inList[1])
    while curr != curr.nextHand:
        for _ in range(syllables-1):
            curr = curr.nextHand
        if curr.hand == 0:
            curr.addNodeAfter(Node(curr.playerNum, 1))
            curr.hand += 1
        elif curr.hand == 1:
            curr.hand += 1
            curr = curr.nextHand
        else:
            curr = curr.removeNode()
    print(curr.playerNum)
