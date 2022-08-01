defmodule RSATest do
  use ExUnit.Case

  @keys %{private_key: {538_007, 186_533}, public_key: {538_007, 2837}}

  describe "encryption" do
    @original_message "HELLOWORLD"

    test "should be able to encrypt a message and then decrypt it" do
      encrypted = RSA.encrypt_message(@original_message, @keys.public_key)

      assert encrypted != @original_message

      decrypted = RSA.decrypt_message(encrypted, @keys.private_key)

      assert "HELLOWORLD" <> _padding = decrypted
    end
  end
end
