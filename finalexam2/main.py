import sys
from functools import reduce

if __name__ == "__main__":
    input()
    answers = [i[0] for i in sys.stdin]
    # print(answers)
    # print(list(zip(answers, answers[1:])))
    print(reduce(
        lambda acc, current: acc + 1 if current[0] == current[1] else acc,
        zip(answers, answers[1:]),
        0))
