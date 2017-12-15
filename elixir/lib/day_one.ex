defmodule DayOne do
  def part_one(input) do
    foo = input
            |> String.codepoints
            |> Enum.map(&String.to_integer/1)

    IO.inspect foo
    [head | tail] = foo
    IO.inspect head
    IO.inspect tail
    bar = tail ++ [head]
    IO.inspect bar
    baz = List.zip([foo, bar])
    IO.inspect baz
  end
end
