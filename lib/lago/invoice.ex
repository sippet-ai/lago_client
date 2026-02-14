defmodule Lago.Invoice do
  @moduledoc """
  Provides struct and type for a Invoice
  """

  @type t :: %__MODULE__{invoice: Lago.InvoiceObjectExtended.t()}

  defstruct [:invoice]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [invoice: {Lago.InvoiceObjectExtended, :t}]
  end
end
