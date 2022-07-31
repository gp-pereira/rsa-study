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

defmodule RSA.Message.Chunk do
  @fill_with "26"

  def split_message(message, n) do
    message
    |> String.graphemes()
    |> Enum.chunk_every(chunk_size(n))
    |> Enum.map(&Enum.join(&1, ""))
    |> Enum.map(&fill_chunk(&1, n))
  end

  defp fill_chunk(chunk, n),
    do: String.pad_trailing(chunk, chunk_size(n), @fill_with)

  def from_integer(integer, n) do
    integer
    |> to_string()
    |> String.pad_leading(chunk_size(n), "0")
  end

  def chunk_size(n) when n <= 25, do: 2

  def chunk_size(n, size \\ 2, cut \\ 25) do
    cut = cut * 100 + 25

    if n < cut, do: size, else: chunk_size(n, size + 2, cut)
  end
end
