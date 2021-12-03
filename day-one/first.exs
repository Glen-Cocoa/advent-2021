defmodule AdventOne do
  def get_input(name) do
    {:ok, input} = File.read(name)
    input
  end

  def input_to_num(input) do
    String.split(input, "\n")
      |> Enum.map(fn x -> String.to_integer(x) end)
  end

  def new_accumulator do
    %{
      currentIndex: 0,
      increases: 0
    }
  end

  def new_accumulator(index, increases) do
    %{
      currentIndex: index,
      increases: increases
    }
  end

  def first_comparator(input, value, acc) do
    if Enum.at(input, acc.currentIndex + 1, 0) > value do
      new_accumulator(acc.currentIndex+1, acc.increases+1)
    else
      new_accumulator(acc.currentIndex+1, acc.increases)
    end
  end

  def second_comparator(input, _value, acc) do
    first_sum =
      Enum.slice(input, acc.currentIndex..acc.currentIndex+2)
      |> Enum.sum()
    second_sum =
      Enum.slice(input, acc.currentIndex+1..acc.currentIndex+3)
      |> Enum.sum()

    if second_sum > first_sum do
      new_accumulator(acc.currentIndex+1, acc.increases+1)
    else
      new_accumulator(acc.currentIndex+1, acc.increases)
    end
  end

  def init(comparator) do
    input =
      get_input("input.txt")
      |> input_to_num

    Enum.reduce(
      input,
      new_accumulator(),
      fn value, acc ->
        comparator.(input, value, acc)
      end)
    end
end

IO.inspect(AdventOne.init(&AdventOne.second_comparator/3))
