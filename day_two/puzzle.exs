# Provided an encrypted strategy guide
#
# ## OPPONENT
# A = 1 point (Rock)
# B = 2 points (Paper
# C = 3 points (Scissors)
#
## ORIGINALLY 
# X = 1 point (Rock)
# Y = 2 points (Paper)
# Z = 3 points (Scissors)
#
# loss = 0 points
# draw = 3 points
# win = 6 points
# 
# You already have a function that maps the outcome of the scores/game
#
# WITH ALL INFORMATION you now know that the second column says how the round needs to end
#
## ROUND SHOULD END
# X = Lose
# Y = Draw
# Z = Win

defmodule Puzzle do
  def create_score(letter) do
    case letter do
      "A" -> 1
      "B" -> 2
      "C" -> 3
      # "X" -> 1
      # "Y" -> 2
      # "Z" -> 3
      "X" -> 0
      "Y" -> 3
      "Z" -> 6
    end
  end

  def game({opponent, me}) do
    case {opponent, me} do
      # {"A", "X"} -> {4, 4}
      # {"A", "Y"} -> {1, 8}
      # {"A", "Z"} -> {7, 3}
      # {"B", "X"} -> {8, 1}
      # {"B", "Y"} -> {5, 5}
      # {"B", "Z"} -> {2, 9}
      # {"C", "X"} -> {3, 7}
      # {"C", "Y"} -> {9, 2}
      # {"C", "Z"} -> {6, 6}

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
  |> IO.inspect()

# first_solution =
# input
# |> Enum.map(fn x -> Puzzle.game(x) end)
# |> Enum.reduce(0, fn x, acc -> elem(x, 1) + acc end)
# |> IO.inspect()

# second_solution =
# input 
# |> 
