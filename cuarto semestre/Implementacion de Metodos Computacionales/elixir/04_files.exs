#File.stream
#File write (sin exclamacion es mejor opcion)

defmodule FileIO do
    def char_shift(char, offset) do
        cond do
        #check if the letter is uppercase
         65 <= char and char <= 90 -> Integer.mod(char - 65 + offset, 26) + 65
         #ASCII value of 'A' is 65
         #check if the letter is lowercase
         97 <= char and char <= 122 -> Integer.mod(char - 97 + offset, 26) + 97
         #Any other character
         true -> char
        end
    end

    def line_shift(line,offset) do
        #Enum.map([1,2,3,4,5,6,7], &:Math.sqrt/1)
        #Using a lambda function for the map
        #to_string(Enum.map(to_charlist(line), fn char -> char_shift(char, offset) end))
        #to_string(Enum.map(to_charlist(line), &char_shift(&1, offset)))

        #step by step
        #temp1 = to_charlist(line)
        #temp2 = Enum.map(temp1,&char_shift(&1, offset))
        #to_string(temp2)

        #Using pipe operator // pasa lo que tenias antes
        line
        |> to_charlist()
        |> IO.inspect()
        |> Enum.map(&char_shift(&1, offset))
        |> to_string()
    end

    def ceasar_encrrypt(in_filename, out_filename, offset) do
      data = in_filename
        |> File.stream!()
        |> Stream.map(&line_shift(&1, offset))
        |> Enum.join("")

        File.write(out_filename, data)
    end

end
