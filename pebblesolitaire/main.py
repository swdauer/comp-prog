import functools as ft
import heapq


def pebbleCount(b):
    return ft.reduce(lambda x, y: x + 1 if y == 'o' else x, b, 0)


# fringe is a min heap from the heapq library
def findMin(fringe):
    currMin = 1000
    while True:
        try:
            currBoard = heapq.heappop(fringe)
            if currBoard[0] == 1:
                return 1
            elif currBoard[0] < currMin:
                currMin = currBoard[0]
            pushNeighbors(fringe, currBoard)
        except IndexError:
            return currMin


def pushNeighbors(fringe, board):
    for i, v in enumerate(board[1]):
        if v == 'o':
            # possible to move v left
            if i > 1 and board[1][i-1] == 'o' and board[1][i-2] == '-':
                # newBoard = board[1]  # .copy()
                # newBoard[i] = '-'
                # newBoard[i-1] = '-'
                # newBoard[i-2] = 'o'
                heapq.heappush(fringe,
                               (board[0]-1, board[1][:i-2]+'o--'+board[1][i+1:]))
            elif i < len(board[1])-2 and board[1][i+1] == 'o' and board[1][i+2] == '-':
                # newBoard=board[1]  # .copy()
                # newBoard[i]='-'
                # newBoard[i+1]='-'
                # newBoard[i+2]='o'
                heapq.heappush(
                    fringe, (board[0]-1, board[1][:i]+'--o'+board[1][i+3:]))


if __name__ == '__main__':
    n = int(input())
    boards = [input() for _ in range(n)]
    for board in boards:
        fringe = []
        heapq.heappush(fringe, (pebbleCount(board), board))
        print(findMin(fringe))
    # print(boards)
