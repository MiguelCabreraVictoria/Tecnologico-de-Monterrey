defmodule Lista do
 def enlist(lista), do: do_enlist(lista,[]) #manda a llamar a la funcion do_enlist
 defp do_enlist([], res), do: Enum.reverse(res) #si la lista esta vacia regresa el resultado
 defp do_enlist([h|t], res), do: do_enlist(t, [[h]|res]) #si la lista no esta vacia, agrega el primer elemento a la lista
end
