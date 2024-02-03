from src.production.calculator import add, sub


def test_add() -> None:
    x = 1
    y = 2
    expected = 3
    actual = add(x, y)
    assert actual == expected


def test_sub() -> None:
    x = 1
    y = 2
    expected = -1
    actual = sub(x, y)
    assert actual == expected
