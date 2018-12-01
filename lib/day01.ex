defmodule Day01 do
  def solve_a do
    {:ok, numbers} = File.read("lib/day01a.input")
    numbers
    |> String.split
    |> Enum.reduce(0, fn(x, acc) -> String.to_integer(x) + acc end)
    |> IO.inspect(label: :answer)
  end

  def solve_b do
    {:ok, numbers} = File.read("lib/day01a.input")
    numbers = numbers |> String.split

    detect_cycle(numbers, numbers)
    |> IO.inspect(label: :answer)
  end

  def detect_cycle(numbers, original_numbers, seen \\ MapSet.new(), acc \\ 0)
  def detect_cycle([], original_numbers, seen, acc) do
    detect_cycle(original_numbers, original_numbers, seen, acc)
  end
  def detect_cycle([h|t], original_numbers, seen, acc) do
    next = String.to_integer(h) + acc
    case MapSet.member?(seen, next) do
      false -> detect_cycle(t, original_numbers, MapSet.put(seen, next), next)
      true -> next
    end
  end
end
