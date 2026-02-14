defmodule Lago.FixedChargeProperties do
  @moduledoc """
  Provides struct and type for a FixedChargeProperties
  """

  @type t :: %__MODULE__{
          amount: String.t() | nil,
          graduated_ranges: [Lago.FixedChargePropertiesGraduatedRanges.t()] | nil,
          volume_ranges: [Lago.FixedChargePropertiesVolumeRanges.t()] | nil
        }

  defstruct [:amount, :graduated_ranges, :volume_ranges]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount: :string,
      graduated_ranges: [{Lago.FixedChargePropertiesGraduatedRanges, :t}],
      volume_ranges: [{Lago.FixedChargePropertiesVolumeRanges, :t}]
    ]
  end
end
