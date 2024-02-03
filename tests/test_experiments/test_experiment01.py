from src.experiments.experiment01 import add


def test_add() -> None:
    x = 1
    y = 2
    expected = 3
    actual = add(x, y)

    assert actual == expected
