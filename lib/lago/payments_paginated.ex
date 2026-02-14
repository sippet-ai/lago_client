defmodule Lago.PaymentsPaginated do
  @moduledoc """
  Provides struct and type for a PaymentsPaginated
  """

  @type t :: %__MODULE__{meta: Lago.PaginationMeta.t(), payments: [Lago.PaymentObject.t()]}

  defstruct [:meta, :payments]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [meta: {Lago.PaginationMeta, :t}, payments: [{Lago.PaymentObject, :t}]]
  end
end
