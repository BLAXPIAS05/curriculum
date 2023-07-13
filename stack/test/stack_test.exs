defmodule StackTest do
	use ExUnit.Case
	doctest Stack
	alias Stack

  test "push/2 adds one element to stack" do
    {:ok, pid} = Stack.start_link([])
    Stack.push(pid, 1)
    assert Stack.pop(pid) == 1
    assert Stack.pop(pid) == nil
  end

  test "pop/1 removes first element of stack" do
    {:ok, pid} = Stack.start_link([1, 2, 3])
    assert Stack.pop(pid) == 1
    assert Stack.pop(pid) == 2
  end
end
