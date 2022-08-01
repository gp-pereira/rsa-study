defmodule RSA.MessageTest do
  use ExUnit.Case

  alias RSA.Message

  describe "encode" do
    test "should replace each char with its numeric representation" do
      assert Message.encode("ABGZ") == "00010625"
    end
  end

  describe "decode" do
    test "should replace each numeric representation with its char" do
      assert Message.decode("00010625") == "ABGZ"
    end
  end
end
