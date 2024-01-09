defmodule GameOfLife.GridTest do
  use ExUnit.Case, async: true

  alias GameOfLife.Grid

  test "new/1 creates a grid of specified size" do
    size = 300
    grid = Grid.new(300)

    assert grid.size == size
  end
end
