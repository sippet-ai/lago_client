defmodule Lago.Coupon do
  @moduledoc """
  Provides struct and type for a Coupon
  """

  @type t :: %__MODULE__{coupon: Lago.CouponObject.t()}

  defstruct [:coupon]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [coupon: {Lago.CouponObject, :t}]
  end
end
