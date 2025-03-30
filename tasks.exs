log = fn v -> inspect(v) |> IO.puts() end

# This task (process) returns {:ok, pid}, but ultimately fails
Task.start(fn -> raise "oops" end)
|> log.()

# Processes are also used to maintain state
# It's a common pattern, so we are given the Agent helper
{:ok, pid} = Agent.start_link(fn -> %{} end)
Agent.update(pid, fn map -> Map.put(map, :hello, :world) end)

Agent.get(pid, fn map -> Map.get(map, :hello) end)
|> log.()
