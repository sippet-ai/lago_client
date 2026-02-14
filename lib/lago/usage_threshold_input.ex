defmodule Lago.UsageThresholdInput do
  @moduledoc """
  Provides struct and type for a UsageThresholdInput
  """

  @type t :: %__MODULE__{
          amount_cents: integer,
          recurring: boolean | nil,
          threshold_display_name: String.t() | nil
        }

  defstruct [:amount_cents, :recurring, :threshold_display_name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount_cents: :integer,
      recurring: :boolean,
      threshold_display_name: {:union, [:string, :null]}
    ]
  end
end
