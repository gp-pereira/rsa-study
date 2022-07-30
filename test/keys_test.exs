defmodule RSA.KeysTest do
  use ExUnit.Case

  alias RSA.Keys

  describe "generate" do
    test "should generate both private and public keys" do
      assert %{
               public_key: {35, _e},
               private_key: {35, _d}
             } = Keys.generate(7, 5)
    end
  end

  describe "generate_public_key" do
    test "should just return the default e if mdc(e, fi) == 1" do
      assert Keys.generate_public_key(7, 5) == 5
    end

    test "should generate another random number and try again otherwise" do
      assert Keys.generate_public_key(10, 5) != 5
    end
  end

  describe "generate_private_key" do
    test "should return the coefficient of e in the mdc(e, fi)" do
      assert Keys.generate_private_key(252, 198) == 4
    end

    test "should always return a positive coefficient" do
      assert Keys.generate_private_key(198, 252) == 247
    end
  end
end
