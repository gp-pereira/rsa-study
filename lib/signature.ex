defmodule RSA.Signature do
  def create(original_signature, private_key),
    do: RSA.encrypt_message(original_signature, private_key)

  def verify(signature, original_signature, public_key) do
    signature
    |> RSA.decrypt_message(public_key)
    |> String.contains?(original_signature)
    |> if do
      :ok
    else
      :error
    end
  end
end
