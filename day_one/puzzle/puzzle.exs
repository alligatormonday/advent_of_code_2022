## List represents the Calories of food carried by Elves
# Need to know which Elf is carrying the most Calories
# How many total Calories is that Elf carrying?

defmodule Puzzle do
  totals =
    File.read("input.txt")
    |> elem(1)
    |> String.split("\n")
    |> Enum.chunk_by(fn x -> x == "" end)
    |> Enum.filter(fn x -> x != [""] end)
    |> Enum.reduce([], fn x, acc ->
      acc ++ [Enum.sum(Enum.map(x, fn y -> String.to_integer(y) end))]
    end)

  highest = Enum.max(totals)

  ## Need to take the top three grossing lists
  # Then total those lists

  top_three =
    totals
    |> Enum.sort()
    |> Enum.take(-3)
    |> Enum.sum()

  IO.inspect(top_three)
end
