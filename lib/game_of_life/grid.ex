defmodule GameOfLife.Grid do
  
  defstruct [:size, :cells]

  @type t :: %__MODULE__{
    size: pos_integer(),
    cells: tuple()
  }

  def new(size) do
    %__MODULE__{
      size: size,
      cells: init_cells(size)
    }
  end

  def switch_life_state(grid, x, y) do
    new_cell_state =
      !( grid.cells
          |> elem(x)
          |> elem(y) )

    new_row = grid.cells
      |> elem(x)
      |> put_elem(y, new_cell_state)

    upd_cells = put_elem(grid.cells, x, new_row)
    %__MODULE__{grid | cells: upd_cells}
  end

  defp init_cells(size) do
    List.duplicate(false, size)
      |> List.to_tuple()
      |> List.duplicate(size)
      |> List.to_tuple()
  end

end
