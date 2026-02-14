defmodule Lago.CouponsPaginated do
  @moduledoc """
  Provides struct and type for a CouponsPaginated
  """

  @type t :: %__MODULE__{coupons: [Lago.CouponObject.t()], meta: Lago.PaginationMeta.t()}

  defstruct [:coupons, :meta]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [coupons: [{Lago.CouponObject, :t}], meta: {Lago.PaginationMeta, :t}]
  end
end
