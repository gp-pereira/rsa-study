defmodule RSA do
  @moduledoc """
  Documentation for `Rsa`.
  """

  alias RSA.{
    Math,
    Message
  }

  def decrypt_message(message, {n, _} = private_key) do
    message
    |> Message.Chunk.split_message(n)
    |> Enum.map(&apply_key(&1, private_key))
    |> Enum.join()
    |> Message.decode()
  end

  def encrypt_message(message, {n, _} = public_key) do
    message
    |> Message.encode()
    |> Message.Chunk.split_message(n)
    |> Enum.map(&apply_key(&1, public_key))
    |> Enum.join()
  end

  def apply_key(chunk, {n, key}) do
    chunk
    |> String.to_integer()
    |> Math.Modulus.pow(key, n)
    |> Message.Chunk.from_integer(n)
  end
end
