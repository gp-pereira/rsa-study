defmodule RSA.Math.EuclidesTest do
  use ExUnit.Case

  doctest RSA.Math.Euclides
  alias RSA.Math.Euclides

  describe "mdc" do
    test "should calculate the mdc between two numbers" do
      assert Euclides.mdc(252, 198) == 18
    end

    test "should not let the order affect the result" do
      assert Euclides.mdc(198, 252) == 18
    end

    test "should not allow division by zero" do
      assert Euclides.mdc(10, 0) == 1
    end
  end

  describe "mdc_with_coefficients" do
    test "should return the mdc and the coefficients" do
      assert Euclides.mdc_with_coefficients(252, 198) == {18, 4, -5}
    end

    test "should not let the order affect the result" do
      assert Euclides.mdc_with_coefficients(198, 252) == {18, -5, 4}
    end

    test "should raise on allow division by zero" do
      assert_raise ArithmeticError, fn -> Euclides.mdc_with_coefficients(10, 0) end
    end
  end
end
