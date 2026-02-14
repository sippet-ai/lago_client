defmodule Lago.LifetimeUsageThresholdObject do
  @moduledoc """
  Provides struct and type for a LifetimeUsageThresholdObject
  """

  @type t :: %__MODULE__{
          amount_cents: integer,
          completion_ratio: number,
          reached_at: DateTime.t() | nil
        }

  defstruct [:amount_cents, :completion_ratio, :reached_at]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount_cents: :integer,
      completion_ratio: :number,
      reached_at: {:union, [{:string, "date-time"}, :null]}
    ]
  end
end
