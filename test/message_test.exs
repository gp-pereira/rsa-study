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

  describe "chunk_size" do
    test "should return 2 if n is too small" do
      assert Message.Chunk.chunk_size(7) == 2
      assert Message.Chunk.chunk_size(25) == 2
    end

    test "should calculate the max length of each chunk" do
      assert Message.Chunk.chunk_size(26) == 2
      assert Message.Chunk.chunk_size(123) == 2
      assert Message.Chunk.chunk_size(3_753_425) == 6
      assert Message.Chunk.chunk_size(321_736_872) == 8
    end
  end
end
