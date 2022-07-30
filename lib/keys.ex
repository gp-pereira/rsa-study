defmodule RSA.Keys do
  alias RSA.Math.Euclides

  @primes "primes.txt"
          |> File.read!()
          |> String.split(",")
          |> Enum.map(&String.to_integer/1)

  def generate(p \\ Enum.random(@primes), q \\ Enum.random(@primes)) do
    n = p * q
    fi = (p - 1) * (q - 1)

    e = generate_public_key(fi)
    d = generate_private_key(e, fi)

    %{public_key: {n, e}, private_key: {n, d}}
  end

  def generate_public_key(fi, e \\ Enum.random(@primes)) do
    if Euclides.mdc(e, fi) == 1, do: e, else: generate_public_key(fi)
  end

  def generate_private_key(e, fi) do
    {_, d, _} = Euclides.mdc_with_coefficients(e, fi)

    if d > 0, do: d, else: d + fi
  end
end
