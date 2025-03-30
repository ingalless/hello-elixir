# Send a message to ourself
# send(self(), {:hello, "world"})
receive do
  {:hello, msg} -> IO.puts(msg)
after
  1_000 -> IO.puts("no messages")
end

# Send a message to a different process
parent = self()
IO.puts(parent |> inspect())

spawn(fn -> send(parent, {:hello, self()}) end)

receive do
  {:hello, pid} -> IO.puts("Got hello from #{inspect(pid)}")
end

# Unlinked processes die alone :(
spawn(fn -> raise "all, by, my, self" end)

receive do
after
  1_000 -> IO.puts("I'm still alive!")
end

# Linked processes die together <3
spawn_link(fn -> raise "all, by, my, self" end)
