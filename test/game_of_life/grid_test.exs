defmodule GameOfLife.GridTest do
  use ExUnit.Case, async: true

  alias GameOfLife.Grid

  test "new/1 creates a grid of specified size" do
    size = 300
    grid = Grid.new(300)

    assert grid.size == size
  end

  test "new/1 Initiates a multidimentional array of specified size" do
    size = 3
    grid = Grid.new(size)

    expected_grid = {
      {false, false, false},
      {false, false, false},
      {false, false, false}
    }

    assert expected_grid == grid.cells
  end
end
