defmodule GameOfLife.Grid do
  
  defstruct [:size, :cells]

  @type :: %__MODULE__{
    size: pos_integer(),
    cells: tuple()
  }

  def new(size) do
    %__MODULE__{
      size: size,
      cells: init_cells(size)
    }
  end

  defp init_cells(size) do
    List.duplicate(false, size)
      |> List.to_tuple/1
      |> List.duplicate(size)
      |> List.to_tuple/1
  end

end
