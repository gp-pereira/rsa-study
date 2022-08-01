defmodule RSA do
  @moduledoc """
  Documentation for `Rsa`.
  """

  alias RSA.{
    Math,
    Message,
    Chunk
  }

  def decrypt_message(message, {n, _} = private_key) do
    message
    |> Chunk.split_encrypted(n)
    |> Enum.map(&apply_key(&1, private_key))
    |> Enum.map(&String.slice(&1, -Chunk.chunk_size(n)..-1))
    |> Enum.join()
    |> Message.decode()
  end

  def encrypt_message(message, {n, _} = public_key) do
    message
    |> Message.encode()
    |> Chunk.split_encoded(n)
    |> Enum.map(&apply_key(&1, public_key))
    |> Enum.join()
  end

  def apply_key(chunk, {n, key}) do
    chunk
    |> String.to_integer()
    |> Math.Modulus.pow(key, n)
    |> Chunk.from_integer(n)
  end
end
