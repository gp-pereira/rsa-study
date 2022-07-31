defmodule RSATest do
  use ExUnit.Case
  # doctest RSA

  describe "apply_key" do
    test "should encrypt a chunk" do
      assert RSA.apply_key("10", {8, 2}) == "04"
    end

    test "should pad the encrypted chunk " do
      assert RSA.apply_key("1217", {12323, 2237}) == "3604"
    end
  end

  @keys %{
    private_key: {939_047, 763_397},
    public_key: {939_047, 293}
  }

  describe "encrypt_message" do
    test "should encrypt a message" do
      assert RSA.encrypt_message("HELLOWORLD", @keys.public_key) ==
               "206612112083155278155084"
    end
  end

  describe "decrypt_message" do
    test "should decrypt a message" do
      assert RSA.decrypt_message("206612112083155278155084", @keys.private_key) ==
               "HELLOWORLD"
    end
  end
end
