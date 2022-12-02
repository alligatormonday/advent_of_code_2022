defmodule Puzzle do
  def game({opponent, me}) do
    case {opponent, me} do
      {"A", "X"} -> {7, 3}
      {"A", "Y"} -> {4, 4}
      {"A", "Z"} -> {1, 8}
      {"B", "X"} -> {8, 1}
      {"B", "Y"} -> {5, 5}
      {"B", "Z"} -> {2, 9}
      {"C", "X"} -> {9, 2}
      {"C", "Y"} -> {6, 6}
      {"C", "Z"} -> {3, 7}
    end
  end
end

input =
  File.read("input.txt")
  |> elem(1)
  |> String.split("\n")
  |> Enum.map(fn x -> String.split(x, " ") end)
  |> Enum.reject(fn x -> x == [""] end)
  |> Enum.map(fn x -> List.to_tuple(x) end)
  |> Enum.map(fn x -> Puzzle.game(x) end)
  |> Enum.reduce(0, fn x, acc -> elem(x, 1) + acc end)
