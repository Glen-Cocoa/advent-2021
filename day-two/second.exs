defmodule AdventTwo do
  def get_input(name) do
    {:ok, input} = File.read(name)
    input
  end

  def input_to_lists(input) do
    String.split(input, "\n")
      |> Enum.map(fn command -> String.split(command, " ") end)
  end

  def get_accumulator do
    %{
      x_axis: 0,
      y_axis: 0,
      aim: 0
    }
  end

  def first_comparator(_input, value, acc) do
    case List.first(value) do
      "forward" -> %{ acc | x_axis: acc.x_axis + String.to_integer(List.last(value))}
      "up" -> %{ acc | y_axis: acc.y_axis - String.to_integer(List.last(value))}
      "down" -> %{ acc | y_axis: acc.y_axis + String.to_integer(List.last(value))}
    end
  end

  def second_comparator(input, value, acc) do
    case List.first(value) do
      "forward" -> %{ acc | x_axis: acc.x_axis + String.to_integer(List.last(value)), y_axis: acc.y_axis + (String.to_integer(List.last(value)) * acc.aim)}
      "up" -> %{ acc | aim: acc.aim - String.to_integer(List.last(value))}
      "down" -> %{ acc | aim: acc.aim + String.to_integer(List.last(value))}
    end
  end

  def init(comparator) do
    input =
      get_input("input.txt")
      |> input_to_lists

      Enum.reduce(
      input,
      get_accumulator(),
      fn value, acc ->
        comparator.(input, value, acc)
      end
    )
  end
end

IO.inspect(
  AdventTwo.init(&AdventTwo.second_comparator/3)
  )
