defmodule Math do
  @moduledoc """
  Provides math-related functions.

  ## Examples

    iex> Math.sum(1, 2)
    3
  """

  @doc """
  Calculates the sum of 2 numbers
  """
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

defmodule MyApp.Status do
  @service URI.parse("https://example.com")

  # The below would error as it has no value
  # @unknown

  @doc """
  Gets the status of an email
  """
  def status(email) do
    IO.puts("Fetching #{@email} from #{@service.host}")
  end
end
