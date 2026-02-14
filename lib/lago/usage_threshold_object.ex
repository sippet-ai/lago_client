defmodule Lago.UsageThresholdObject do
  @moduledoc """
  Provides struct and type for a UsageThresholdObject
  """

  @type t :: %__MODULE__{
          amount_cents: integer,
          created_at: DateTime.t(),
          lago_id: String.t(),
          recurring: boolean,
          threshold_display_name: String.t() | nil,
          updated_at: DateTime.t()
        }

  defstruct [
    :amount_cents,
    :created_at,
    :lago_id,
    :recurring,
    :threshold_display_name,
    :updated_at
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount_cents: :integer,
      created_at: {:string, "date-time"},
      lago_id: {:string, "uuid"},
      recurring: :boolean,
      threshold_display_name: {:union, [:string, :null]},
      updated_at: {:string, "date-time"}
    ]
  end
end
