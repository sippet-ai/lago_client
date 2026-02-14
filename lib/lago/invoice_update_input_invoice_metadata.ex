defmodule Lago.InvoiceUpdateInputInvoiceMetadata do
  @moduledoc """
  Provides struct and type for a InvoiceUpdateInputInvoiceMetadata
  """

  @type t :: %__MODULE__{id: String.t() | nil, key: String.t() | nil, value: String.t() | nil}

  defstruct [:id, :key, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [id: {:string, "uuid"}, key: :string, value: :string]
  end
end
