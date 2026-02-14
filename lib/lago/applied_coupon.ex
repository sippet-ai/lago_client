defmodule Lago.AppliedCoupon do
  @moduledoc """
  Provides struct and type for a AppliedCoupon
  """

  @type t :: %__MODULE__{applied_coupon: Lago.AppliedCouponObject.t()}

  defstruct [:applied_coupon]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [applied_coupon: {Lago.AppliedCouponObject, :t}]
  end
end
