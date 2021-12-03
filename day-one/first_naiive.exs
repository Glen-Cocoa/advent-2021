{:ok, input} = File.read("input.txt")
split = String.split(input, "\n") |> Enum.map(fn x -> String.to_integer(x) end)

increases =
  Enum.reduce(
    split,
    %{
      currentIndex: 0,
      increases: -1
    },
    fn x, acc ->
      if Enum.at(split, acc.currentIndex + 1) > x do
        %{
          currentIndex: acc.currentIndex + 1,
          increases: acc.increases + 1
        }
      else
        %{
          currentIndex: acc.currentIndex + 1,
          increases: acc.increases
        }
      end
    end)

IO.inspect(increases)
