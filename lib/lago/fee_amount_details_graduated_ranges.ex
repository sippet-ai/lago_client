defmodule Lago.FeeAmountDetailsGraduatedRanges do
  @moduledoc """
  Provides struct and type for a FeeAmountDetailsGraduatedRanges
  """

  @type t :: %__MODULE__{
          flat_unit_amount: String.t(),
          from_value: integer,
          per_unit_amount: String.t(),
          per_unit_total_amount: String.t(),
          to_value: integer | nil,
          total_with_flat_amount: String.t(),
          units: String.t()
        }

  defstruct [
    :flat_unit_amount,
    :from_value,
    :per_unit_amount,
    :per_unit_total_amount,
    :to_value,
    :total_with_flat_amount,
    :units
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      flat_unit_amount: :string,
      from_value: :integer,
      per_unit_amount: :string,
      per_unit_total_amount: :string,
      to_value: {:union, [:integer, :null]},
      total_with_flat_amount: :string,
      units: :string
    ]
  end
end
