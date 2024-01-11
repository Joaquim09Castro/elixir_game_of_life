defmodule GameOfLife.CellFunctionTest do
  use ExUnit.Case, async: true

  alias GameOfLife.Grid
  alias GameOfLife.CellFunction, as: CellFunc

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
          CellFunc.should_be_active?(grid, x, y)
        end
      end

    result =
      result
        |> Enum.map(&List.to_tuple/1)
        |> List.to_tuple()

    assert expected_grid.cells == result
  end
end
