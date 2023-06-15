#Functions to work lists
#Designed by professor Ariel Ortiz (CEM)
#
#Miguel Angel Cabrera Victoria
# 2023-04-24

defmodule Hw.Ariel2 do

  def insert(list,item),
    do: do_insert(list,item,[])

  defp do_insert([], item, temp),
    do: Enum.reverse(temp) ++ [item]

  defp do_insert([head | tail], item, temp) when item < head ,
    do: Enum.reverse(temp) ++ [item, head | tail]

  defp do_insert([head | tail], item, temp),
    do: do_insert(tail, item, [head | temp])

end


# Path: cuarto semestre/Implementacion de Metodos Computacionales/elixir/hw/lib/ariel3.ex
