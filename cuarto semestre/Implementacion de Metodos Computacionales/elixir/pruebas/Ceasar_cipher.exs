def char_shift(char, offset) do
  cond do
    # Check if the letter is uppercase
    65 <= char and char <= 90 -> Integer.mod(char - 65 + offset, 26) + 65
    # Check if the letter is lowercase
    97 <= char and char <= 122 -> Integer.mod(char - 97 + offset, 26) + 97
    # Any other character
    true -> char
  end
end 
