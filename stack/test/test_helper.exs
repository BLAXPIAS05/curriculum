ExUnit.start(auto_run: false)

defmodule StackTest do
  use ExUnit.Case

  test "Stack receives :push call" do
    {:ok, pid} = Stack.start_link([])
    Stack.push(pid, 1)
    assert Stack.pop(pid) == 1
    assert Stack.pop(pid) == nil
  end
end

ExUnit.run()
