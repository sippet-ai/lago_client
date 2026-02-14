defmodule Lago.AppliedCouponsPaginated do
  @moduledoc """
  Provides struct and type for a AppliedCouponsPaginated
  """

  @type t :: %__MODULE__{
          applied_coupons: [Lago.AppliedCouponObjectExtended.t()],
          meta: Lago.PaginationMeta.t()
        }

  defstruct [:applied_coupons, :meta]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [applied_coupons: [{Lago.AppliedCouponObjectExtended, :t}], meta: {Lago.PaginationMeta, :t}]
  end
end
