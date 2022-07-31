defmodule RSA.Math.Modulus do
  @doc """
  Recursively calculate remainder of base^exp and mod.
  """
  def pow(base, exp, mod)

  def pow(0, _exp, _mod), do: 0

  def pow(_base, 0, _mod), do: 1

  def pow(base, exp, mod) when rem(exp, 2) == 0 do
    step = pow(base, div(exp, 2), mod)
    step = rem(step * step, mod)

    rem(step + mod, mod)
  end

  def pow(base, exp, mod) do
    step = rem(base, mod)
    step = rem(step * rem(pow(base, exp - 1, mod), mod), mod)

    rem(step + mod, mod)
  end
end
