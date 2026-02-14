defmodule Lago.CustomerCreateInputCustomerMetadata do
  @moduledoc """
  Provides struct and type for a CustomerCreateInputCustomerMetadata
  """

  @type t :: %__MODULE__{
          display_in_invoice: boolean,
          id: String.t() | nil,
          key: String.t(),
          value: String.t()
        }

  defstruct [:display_in_invoice, :id, :key, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [display_in_invoice: :boolean, id: {:string, "uuid"}, key: :string, value: :string]
  end
end
