defmodule RSA.Chunk do
  @fill_with RSA.Message.encode("X")

  def split_encoded(encoded_message, n) do
    encoded_message
    |> String.graphemes()
    |> Enum.chunk_every(chunk_size(n))
    |> Enum.map(&Enum.join(&1, ""))
    |> Enum.map(&String.pad_trailing(&1, chunk_size(n), @fill_with))
  end

  def chunk_size(n) when n <= 25, do: 2

  def chunk_size(n, size \\ 2, cut \\ 25) do
    cut = cut * 100 + 25

    if n < cut, do: size, else: chunk_size(n, size + 2, cut)
  end

  def from_integer(integer, n) do
    integer
    |> to_string()
    |> String.pad_leading(String.length(to_string(n)), "0")
  end
end
