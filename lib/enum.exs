odd? = fn x -> rem(x, 2) != 0 end

tripled_and_sum_odds =
  1..100_000
  |> Enum.map(&(&1 * 3))
  |> Enum.filter(odd?)
  |> Enum.sum()

tripled_and_sum_odds_streamed =
  1..100_000
  |> Stream.map(&(&1 * 3))
  |> Stream.filter(odd?)
  |> Enum.sum()

three_lines =
  "#{File.cwd!()}/data.txt"
  |> File.stream!()
  |> Enum.take(3)

IO.puts(tripled_and_sum_odds)
IO.puts(tripled_and_sum_odds_streamed)
IO.puts(three_lines)
