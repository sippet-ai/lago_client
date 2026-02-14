defmodule Lago.FixedChargePropertiesGraduatedRanges do
  @moduledoc """
  Provides struct and type for a FixedChargePropertiesGraduatedRanges
  """

  @type t :: %__MODULE__{
          flat_amount: String.t(),
          from_value: integer,
          per_unit_amount: String.t(),
          to_value: integer | nil
        }

  defstruct [:flat_amount, :from_value, :per_unit_amount, :to_value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      flat_amount: :string,
      from_value: :integer,
      per_unit_amount: :string,
      to_value: {:union, [:integer, :null]}
    ]
  end
end
