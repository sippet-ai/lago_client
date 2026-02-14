defmodule Lago.InvoicedUsages do
  @moduledoc """
  Provides struct and type for a InvoicedUsages
  """

  @type t :: %__MODULE__{invoiced_usages: [Lago.InvoicedUsageObject.t()]}

  defstruct [:invoiced_usages]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [invoiced_usages: [{Lago.InvoicedUsageObject, :t}]]
  end
end
