defmodule Lago.InvoiceMetadataObject do
  @moduledoc """
  Provides struct and type for a InvoiceMetadataObject
  """

  @type t :: %__MODULE__{
          created_at: DateTime.t() | nil,
          key: String.t() | nil,
          lago_id: String.t() | nil,
          value: String.t() | nil
        }

  defstruct [:created_at, :key, :lago_id, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [created_at: {:string, "date-time"}, key: :string, lago_id: {:string, "uuid"}, value: :string]
  end
end
