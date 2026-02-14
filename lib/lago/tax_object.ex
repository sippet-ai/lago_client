defmodule Lago.TaxObject do
  @moduledoc """
  Provides struct and type for a TaxObject
  """

  @type t :: %__MODULE__{
          applied_to_organization: boolean,
          code: String.t(),
          created_at: DateTime.t(),
          description: String.t() | nil,
          lago_id: String.t(),
          name: String.t(),
          rate: number
        }

  defstruct [:applied_to_organization, :code, :created_at, :description, :lago_id, :name, :rate]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      applied_to_organization: :boolean,
      code: :string,
      created_at: {:string, "date-time"},
      description: {:union, [:string, :null]},
      lago_id: {:string, "uuid"},
      name: :string,
      rate: :number
    ]
  end
end
