defmodule GameOfLife.CellFunction do
  defp is_active?(grid, x, y) do
    grid.cells
      |> elem(x)
      |> elem(y)
  end

  def should_be_active?(grid, x, y) do
    neighbours = get_actives(grid, x, y)
    is_active? = is_active?(grid, x, y)

    cond do
      !(is_active?) && neighbours == 3 ->
        true
      is_active? && neighbours in 2..3 ->
        true
      true ->
        false
    end
  end

  defp get_neighbours(grid, x, y) do
    for x_area <- (x - 1..x + 1), y_area <- (y - 1..y + 1),
        x_area >= 0, y_area >= 0,
        x_area < grid.size, y_area < grid.size,
        x_area != x or y_area != y do
      {x_area, y_area}
    end
  end

  defp get_actives(grid, x, y) do
    grid
      |> get_neighbours(x, y)
      |> Enum.map(fn {x_area, y_area} -> is_active?(grid, x_area, y_area) end)
      |> Enum.count(& &1)
  end
end
