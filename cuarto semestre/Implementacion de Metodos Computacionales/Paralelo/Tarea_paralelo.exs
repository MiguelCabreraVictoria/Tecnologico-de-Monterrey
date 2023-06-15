defmodule PrimeSum do
  def is_prime(n) when n <= 1 do
    false
  end

  def is_prime(n) when n <= 3 do
    true
  end

  def is_prime(n) do
    for i <- 2..(div(n, 2)), rem(n, i) == 0, do: false
  end

  def sum_primes_parallel({start, finish}) do
    Enum.sum(Enum.filter(start..finish, &is_prime/1))
  end

  def make_ranges(start, finish, cores) do
    range_size = div(finish - start + 1, cores)

    Enum.map(0..(cores - 1), fn index ->
      range_start = start + (index * range_size)
      range_end = range_start + range_size - 1

      {range_start, range_end}
    end)
  end

  def sum_primes(start, finish, cores) do
    ranges = make_ranges(start, finish, cores)

    ranges
    |> Enum.map(&Task.async(fn -> sum_primes_parallel(&1) end))
    |> Enum.map(&Task.await(&1))
    |> IO.inspect()
    |> Enum.sum()
  end
end
