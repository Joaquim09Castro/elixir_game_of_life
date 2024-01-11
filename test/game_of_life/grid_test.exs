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

  test "switch_life_state/3 will change the state of specified cells" do
    size = 3
    grid = Grid.new(size)
      |> Grid.switch_life_state(0, 0)
      |> Grid.switch_life_state(1, 1)
      |> Grid.switch_life_state(2, 2)

    expected_grid = {
      {true, false, false},
      {false, true, false},
      {false, false, true}
    }

    assert expected_grid == grid.cells
  end
  
  test "State is changing according to rules" do
    size = 5
    grid =
      Grid.new(size)
          |> Grid.switch_life_state(2, 0)
          |> Grid.switch_life_state(3, 1)
          |> Grid.switch_life_state(1, 2)
          |> Grid.switch_life_state(2, 2)
          |> Grid.switch_life_state(3, 2)

    expected_grid =
      Grid.new(size)
        |> Grid.switch_life_state(1, 1)
        |> Grid.switch_life_state(3, 1)
        |> Grid.switch_life_state(2, 2)
        |> Grid.switch_life_state(3, 2)
        |> Grid.switch_life_state(2, 3)

    result =
      for x <- 0..size - 1 do
        for y <- 0..size - 1 do
          Grid.should_be_active?(grid, x, y)
        end
      end

    result =
      result
        |> Enum.map(&List.to_tuple/1)
        |> List.to_tuple()

    assert expected_grid.cells == result
  end
end
