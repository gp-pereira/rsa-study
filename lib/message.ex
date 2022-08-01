defmodule RSA.Message do
  @alphabet "lib/constant/alphabet.txt"
            |> File.read!()
            |> String.split(",")

  def encode(message) do
    message
    |> String.graphemes()
    |> Enum.map(&encode_letter/1)
    |> Enum.join()
  end

  defp encode_letter(letter) do
    @alphabet
    |> Enum.find_index(fn l -> l == letter end)
    |> to_string()
    |> String.pad_leading(2, "0")
  end

  def decode(message) do
    message
    |> String.graphemes()
    |> Enum.chunk_every(2)
    |> Enum.map(&decode_letter/1)
    |> Enum.join()
  end

  defp decode_letter(graphemes) do
    graphemes
    |> Enum.join()
    |> String.to_integer()
    |> then(&Enum.at(@alphabet, &1))
  end
end
