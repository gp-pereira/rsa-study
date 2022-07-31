defmodule RSA.SignatureTest do
  use ExUnit.Case

  alias RSA.Signature

  @keys %{
    private_key: {939_047, 763_397},
    public_key: {939_047, 293}
  }

  @original_signature "THISISASIGNATURE"

  describe "create" do
    test "should create a signature using the private key" do
      assert Signature.create(@original_signature, @keys.private_key) ==
               "637422643338711572154722817209732816"
    end
  end

  describe "verify" do
    test "should return :ok if the signature was created by the private pair" do
      signature = "637422643338711572154722817209732816"

      assert Signature.verify(signature, @original_signature, @keys.public_key) == :ok
    end

    test "should return :error if the signature was not created by the private pair" do
      signature = "3218729387912732783172312382239"

      assert Signature.verify(signature, @original_signature, @keys.private_key) == :error
    end
  end
end
