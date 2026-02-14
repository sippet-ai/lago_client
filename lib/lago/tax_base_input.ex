defmodule Lago.TaxBaseInput do
  @moduledoc """
  Provides struct and type for a TaxBaseInput
  """

  @type t :: %__MODULE__{
          applied_to_organization: boolean | nil,
          code: String.t() | nil,
          description: String.t() | nil,
          name: String.t() | nil,
          rate: String.t() | nil
        }

  defstruct [:applied_to_organization, :code, :description, :name, :rate]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      applied_to_organization: :boolean,
      code: :string,
      description: {:union, [:string, :null]},
      name: :string,
      rate: :string
    ]
  end
end
