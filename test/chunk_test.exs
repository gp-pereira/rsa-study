defmodule RSA.ChunkTest do
  use ExUnit.Case

  alias RSA.{
    Chunk,
    Message
  }

  describe "split_encoded" do
    test "should split an encoded message into chunks" do
      assert "HELLOWORLD"
             |> Message.encode()
             |> Chunk.split_encoded(987_654_321)
             |> Enum.map(&Message.decode/1) == ["HELL", "OWOR", "LDXX"]
    end
  end
end
