import sys

from .calculator import add, sub

calculation_type = sys.argv[1]
x = float(sys.argv[2])
y = float(sys.argv[3])

if calculation_type == "add":
    print(add(x, y))
elif calculation_type == "sub":
    print(sub(x, y))
else:
    ValueError(f"not implemented: {calculation_type}")
