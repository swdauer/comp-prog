#####################
#
# tetration e.g. limit n -> inf of x^x^x^...^x (right associative) repeated n times
# converges to y where y = x^y. Therefore x = y^(1/y)
#
#####################

if __name__ == "__main__":
    y = float(input())
    print(y**(1/y))
