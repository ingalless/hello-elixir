# Immutability means we iterate through recursion
defmodule Recursion do
  def print_times(msg, n) when n > 0 do
    IO.puts(msg)
    print_times(msg, n - 1)
  end

  # Base case
  def print_times(_msg, 0) do
    :ok
  end
end

defmodule Math do
  def double_each([head | tail]) do
    [head * 2 | double_each(tail)]
  end

  def double_each([]) do
    []
  end

  def sum_list([head | tail], accumulator) do
    sum_list(tail, head + accumulator)
  end

  # Base case, again
  def sum_list([], accumulator) do
    accumulator
  end
end

Recursion.print_times("Hello", 3)
# doubled = Math.double_each([1, 2, 3])
doubled = Enum.map([1, 2, 3], fn x -> x * 2 end)
sum = Enum.reduce([1, 2, 3], fn x, acc -> acc + x end)
IO.puts(sum)
IO.puts(Kernel.inspect(doubled))
