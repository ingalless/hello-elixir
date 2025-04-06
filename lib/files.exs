log = fn x -> inspect(x) |> IO.puts() end

data = ["999", "Police", 99.99, 101.99] |> Enum.join("|")
log.(data)

{:ok, file} =
  Path.join(File.cwd!(), "data.txt")
  |> File.open([:append])

IO.binwrite(file, data)
File.close(file)
File.read("#{File.cwd!()}/data.txt") |> log.()

# Pattern match
case File.read("/unknown/file/path") do
  {:ok, _body} -> IO.puts("Now that's weird")
  {:error, reason} -> IO.puts(reason)
end

# However, if the process should raise a meaningful error
# in the case of a missing file, prefer the ! version.
File.read!("/unknown/file/path")
