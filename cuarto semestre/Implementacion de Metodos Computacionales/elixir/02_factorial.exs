#Implementation of the factorial using recursion
#
#Miguel Angel Cabrera Victoria


#Create a new module. All module names must start with Uppercase
defmodule Recur do

#Create a function. All functions names must start with lowecase
def fact(n) do
  if n== 0 do
    1
  else
    n * fact(n-1)
    end
  end

  #Using Pettern Matching 

  def fact(0), do: 1
  def fact(n), do: n * fact(n - 1)

  def fact_tail(n), do: do_fact_tail(n,1)
  
  #Using a 'guard' to indentify different cases
  defp do_fact_tail(n,r) when r < 1, do: 1
  defp do_fact_tail(n,r), do: do_fact_tail(n-1,r*n)

  #FIBONACCI

  def fibo(n) when n < 0, do: :error
  def fibo(0), do: 0
  def fibo(1), do: 1
  def fibo(n), do: fibo(n - 1) + fibo(n - 2)

  @doc """
  Get the Fibonacci number at the specified index, using tail recursion
  """

  def fibo_tail(n) when n < 0, do: {:error, :negative}
  def fibo_tail(0), do: {:ok, 0}
  def fibo_tail(1), do: {:ok, 1}
  def fibo_tail(n), do: {:ok, do_fibo_tail(0, 1, n - 1)}

  
  #Private function to do the recursion
  defp do_fibo_tail(_a, b, 0), do: b
  defp do_fibo_tail(a, b, n), do: do_fibo_tail(b, a + b, n - 1)




end
