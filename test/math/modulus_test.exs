defmodule RSA.Math.ModulusTest do
  use ExUnit.Case

  alias RSA.Math.Modulus

  describe "pow" do
    test "should quickly calculate the modulus of an exponentiation" do
      assert Modulus.pow(10, 0, 8) == 1
      assert Modulus.pow(10, 1, 8) == 2
      assert Modulus.pow(10, 2, 8) == 4
      assert Modulus.pow(10, 3, 8) == 0
    end
  end
end
