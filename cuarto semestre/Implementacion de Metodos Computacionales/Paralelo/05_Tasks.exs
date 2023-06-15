defmodule Concur do
alias Mix.Tasks


  def test_function(id) do
    IO.puts("I am #{id}")
  end

  def main() do
    IO.puts("MAIN THREAD STARTING")
    # Create a new process
    id1 = Task.async(fn -> test_function("One") end)
    id2 = Task.async(fn -> test_function("Two") end)
    id3 = Task.async(fn -> test_function("Three") end)
    Task.await(id1)
    Task.await(id2)
    Task.await(id3)
    IO.puts("MAIN THREAD FINISHING")
  end

  def main2() do
    ["One", "Two", "Three", "Four"]
    |> Enum.map(&Task.async(fn -> test_function(&1) end))
    |> IO.inspect()
    |> Enum.map(&Task.await(&1))
    |> IO.inspect()
    IO.puts("MAIN THREAD FINISHING")

  end

end

defmodule Sums do
  def range_sum({start, finish}) do
    Enum.sum(start..finish)
  end

  def make_ranges(start,finish,cores) do
    [{100,200},{201,300},{301,400},{401,500}]
  end

  def total_sum(start,finish,cores) do
    [{100,200},{201,300},{301,400},{401,500}]
    |> Enum.map(&Task.async(fn -> range_sum(&1) end))
    |> IO.inspect()
    |> Enum.map(&Task.await(&1))
    |> IO.inspect()
    |> Enum.sum()
  end
end
