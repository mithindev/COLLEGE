class Calculator:
    def __init__(self):
       pass

    def add(self, x, y):
        return x + y

    def subtract(self, x, y):
        return x - y

    def multiply(self, x, y):
        return x * y

    def divide(self, x, y):
        if y != 0:
            return x / y
        else:
            return "Error!"

calc = Calculator()

add = calc.add(5, 3)
subtract = calc.subtract(8, 2)
multiply = calc.multiply(4, 6)
divide = calc.divide(10, 2)
