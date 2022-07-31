defmodule RSA.Signature do
  def create(original_signature, private_key),
    do: RSA.encrypt_message(original_signature, private_key)

  def verify(signature, original_signature, public_key) do
    if RSA.decrypt_message(signature, public_key) == original_signature,
      do: :ok,
      else: :error
  end
end
