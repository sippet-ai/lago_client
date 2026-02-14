defmodule Lago.CustomerMetadata do
  @moduledoc """
  Provides struct and type for a CustomerMetadata
  """

  @type t :: %__MODULE__{
          created_at: DateTime.t(),
          display_in_invoice: boolean,
          key: String.t(),
          lago_id: String.t(),
          value: String.t()
        }

  defstruct [:created_at, :display_in_invoice, :key, :lago_id, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, "date-time"},
      display_in_invoice: :boolean,
      key: :string,
      lago_id: {:string, "uuid"},
      value: :string
    ]
  end
end
