defmodule Lago.EventInputObject do
  @moduledoc """
  Provides struct and type for a EventInputObject
  """

  @type t :: %__MODULE__{
          code: String.t(),
          external_subscription_id: String.t(),
          precise_total_amount_cents: String.t() | nil,
          properties: map | nil,
          timestamp: integer | String.t() | nil,
          transaction_id: String.t()
        }

  defstruct [
    :code,
    :external_subscription_id,
    :precise_total_amount_cents,
    :properties,
    :timestamp,
    :transaction_id
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code: :string,
      external_subscription_id: :string,
      precise_total_amount_cents: {:union, [:string, :null]},
      properties: {:union, [:map, :null]},
      timestamp: {:union, [:integer, :string]},
      transaction_id: :string
    ]
  end
end
