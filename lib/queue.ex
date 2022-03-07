defmodule Queue do
  use GenServer

  def start_link(initial_state) when is_list(initial_state) do
    GenServer.start_link(__MODULE__, initial_state)
  end

  def enqueue(pid, element) do
    GenServer.cast(pid, {:push, element})
  end

  def dequeue(pid) do
    GenServer.call(pid, :pop)
  end

  @impl true
  def init(state) do
    {:ok, state}
  end

  @impl true
  def handle_call(:pop, _from, queue) when length(queue) > 0 do
    {elem, new_queue} = List.pop_at(queue, -1)
    {:reply, elem, new_queue}
  end

  @impl true
  def handle_call(:pop, _from, []) do
    {:reply, nil, []}
  end

  @impl true
  def handle_cast({:push, element}, queue) do
    {:noreply, [element | queue]}
  end
end
