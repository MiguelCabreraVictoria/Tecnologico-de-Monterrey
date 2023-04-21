#Functions to work with lists

#Miguel Angel Cabrera Victoria

#data = [1,2,3,4,5,6]
#hd(data) -> head
#tl(data) -> tail


defmodule Listas do

  @doc """
  Literal function to sum the elements in a list
  """
  def sum (list) do
    if list == [] do
      0
    else
      hd(list) + sum(tl(list))
    end
  end

  @doc """
  Using pattern metaching to identify the base case
  """

  def sum2([]), do: 0
  def sum2(list), do: hd(list) + sum2(tl(list))

  @doc """
  Using pattern marching to desconstruct the list
  """

  def sum3([]), do: 0
  def sum3([head | tail]), do: head + sum3(tail)

  @doc """
  Enlist function. Create a new list where each element of the input is itself in a list
  """
  def enlist(list), do: do_enlist(list,[])

  defp do_enlist([], res), do: Enum.reverse(res)
  defp do_enlist([head | tail], res), do: do_enlist(tail, [[head] | res])

  @doc """
  Create a new list that return the positive numbers
  """

  def filter_positives(list), do: do_filter(list)

  defp do_filter([]), do: []
  defp do_filter([head | tail]) when head >= 0, do: [head | do_filter(tail)]
  defp do_filter([_head | tail]), do: do_filter(tail)






end
