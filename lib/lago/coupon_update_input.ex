defmodule Lago.CouponUpdateInput do
  @moduledoc """
  Provides struct and type for a CouponUpdateInput
  """

  @type t :: %__MODULE__{coupon: Lago.CouponBaseInput.t()}

  defstruct [:coupon]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [coupon: {Lago.CouponBaseInput, :t}]
  end
end
