defmodule Lago.ChargePropertiesGraduatedPercentageRanges do
  @moduledoc """
  Provides struct and type for a ChargePropertiesGraduatedPercentageRanges
  """

  @type t :: %__MODULE__{
          flat_amount: String.t(),
          from_value: integer,
          rate: String.t(),
          to_value: integer | nil
        }

  defstruct [:flat_amount, :from_value, :rate, :to_value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      flat_amount: {:string, "^[0-9]+.?[0-9]*$"},
      from_value: :integer,
      rate: {:string, "^[0-9]+.?[0-9]*$"},
      to_value: {:union, [:integer, :null]}
    ]
  end
end
