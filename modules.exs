defmodule Math do
  def sum(a, b) do
    do_sum(a, b)
  end

  # defp, where p is for private!
  defp do_sum(a, b) do
    a + b
  end

  # Shorthand def can be used.
  def zero?(0), do: true

  # The trailing ? means the function returns a boolean
  # This guard asserts the function is called with an integer
  def zero?(x) when is_integer(x) do
    false
  end
end

defmodule Concat do
  # This "head" function defines the function shape.
  # This is needed because of the guard below + the use of a
  # default value
  def join(a, b, sep \\ " ")

  # Notice that the _ denotes an unused var
  def join(a, b, _sep) when b == "" do
    a
  end

  def join(a, b, sep) do
    a <> sep <> b
  end
end

IO.puts(Math.sum(2, 3))
# Errors, because it is private above
# IO.puts(Math.do_sum(2, 3))

IO.puts(Math.zero?(0))
IO.puts(Math.zero?(1))
# Would error because of the is_integer guard
# IO.puts(Math.zero?(0.0))

# => Hello
IO.puts(Concat.join("Hello", ""))
# => Hello world
IO.puts(Concat.join("Hello", "world"))
# => Hello_world
IO.puts(Concat.join("Hello", "world", "_"))
