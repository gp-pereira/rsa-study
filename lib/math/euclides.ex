defmodule RSA.Math.Euclides do
  @doc """
    Uses Euclides' algorithm to calculate the mdc between two numbers.

    Examples
    iex> RSA.Math.Euclides.mdc(252, 198)
    18

    iex> RSA.Math.Euclides.mdc(11, 50)
    1
  """
  def mdc(_n1, 0), do: 1

  def mdc(n1, n2) do
    case rem(n1, n2) do
      1 -> 1
      0 -> n2
      _ -> mdc(n2, rem(n1, n2))
    end
  end

  @doc """
    Uses Euclides' extended algorithm to calculate the mdc and the
    coefficients of its linear combination. For instance, mdc(252, 198) = 18
    and 18 = (4 * 252) + (-5 * 198).

    Examples
    iex> RSA.Math.Euclides.mdc_with_coefficients(252, 198)
    {18, 4, -5}

    iex> RSA.Math.Euclides.mdc_with_coefficients(11, 50)
    {1, -9, 2}
  """
  def mdc_with_coefficients(n1, n2),
    do: mdc_with_coefficients({n1, n2, [div(n1, n2)], [rem(n1, n2)], [1], [0]})

  defp mdc_with_coefficients({_r, r1, [q1], [r2], [1], [0]}) do
    mdc_with_coefficients({
      r1,
      r2,
      [q1, div(r1, r2)],
      [r2, rem(r1, r2)],
      [1, 0],
      [0, 1]
    })
  end

  defp mdc_with_coefficients({_r, _r1, [q1, _q], [r3, 0], [s2, s1], [t2, t1]}),
    do: {r3, s2 - q1 * s1, t2 - q1 * t1}

  defp mdc_with_coefficients({_r, r1, [q1, q], [_r3, r2], [s2, s1], [t2, t1]}) do
    mdc_with_coefficients({
      r1,
      r2,
      [q, div(r1, r2)],
      [r2, rem(r1, r2)],
      [s1, s2 - q1 * s1],
      [t1, t2 - q1 * t1]
    })
  end
end
