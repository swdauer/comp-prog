import io


def decode(message):
    output = io.StringIO()
    i = 0

    while i < len(message):
        if i > len(message)-3:
            output.write(message[i:])
            break
        output.write(message[i])
        if message[i] in "aeiou":
            i += 3
        else:
            i += 1

    return output.getvalue()


if __name__ == "__main__":
    print(decode(input()))
