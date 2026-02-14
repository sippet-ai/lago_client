defmodule Lago.AppliedCouponInput do
  @moduledoc """
  Provides struct and type for a AppliedCouponInput
  """

  @type t :: %__MODULE__{applied_coupon: Lago.AppliedCouponInputAppliedCoupon.t()}

  defstruct [:applied_coupon]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [applied_coupon: {Lago.AppliedCouponInputAppliedCoupon, :t}]
  end
end
