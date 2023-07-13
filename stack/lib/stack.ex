defmodule Stack do
  @moduledoc """
  iex> {:ok, pid} = Stack.start_link([])
  iex> :ok = Stack.push(pid, 1)
  iex> Stack.pop(pid)
  1
  iex> Stack.pop(pid)
  nil
  """

  use GenServer

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, [])
  end

  def push(stack_pid, element) do
    GenServer.cast(stack_pid, {:push, element})
  end

  def pop(stack_pid) do
    GenServer.call(stack_pid, :pop)
  end

  # -----------------------------------------------

  def init(state) do
    {:ok, state}
  end

  def handle_cast({:push, value}, state) do
    {:noreply, [value | state]}
  end

  def handle_call(:pop, _from, state) do
    case state do
      [] -> {:reply, nil, state}
      [head | tail] -> {:reply, head, tail}
    end
  end
end
