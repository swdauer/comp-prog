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
            print(currBoard)
            if currBoard[0] == 1:
                return 1
            elif currBoard[0] < currMin:
                currMin = currBoard[0]
            pushNeighbors(fringe, currBoard)
        except IndexError:
            return currMin


def replace3(s, index, repl):
    return s[:index]+repl+s[index+3:]


def pushNeighbors(fringe, board):
    for i, v in enumerate(board[1]):
        if v == 'o':
            # possible to move v left
            if i >= 2 and board[1][i-1] == 'o' and board[1][i-2] == '-':
                heapq.heappush(
                    fringe, (board[0]-1, replace3(board[1], i-2, 'o--')))
            if i <= len(board[1])-3 and board[1][i+1] == 'o' and board[1][i+2] == '-':
                heapq.heappush(
                    fringe, (board[0]-1, replace3(board[1], i, '--o')))


if __name__ == '__main__':
    n = int(input())
    boards = [input() for _ in range(n)]
    for board in boards:
        fringe = []
        heapq.heappush(fringe, (pebbleCount(board), board))
        print("============")
        print(board)
        print("============")
        print(findMin(fringe))
    # print(boards[0])
    # print(replace3(boards[0], 0, 'o--'))
    # print(replace3(boards[0], len(boards[0])-3, 'o-o'))
    # print(replace3(boards[0], 0, 'o--'))
    # print(boards[0])
