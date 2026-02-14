defmodule Lago.EventsCreatedEvents do
  @moduledoc """
  Provides struct and type for a EventsCreatedEvents
  """

  @type t :: %__MODULE__{
          code: String.t() | nil,
          created_at: DateTime.t() | nil,
          external_subscription_id: String.t() | nil,
          lago_customer_id: nil,
          lago_id: String.t() | nil,
          lago_subscription_id: String.t() | nil,
          precise_total_amount_cents: String.t() | nil,
          properties: map | nil,
          timestamp: DateTime.t() | nil,
          transaction_id: String.t() | nil
        }

  defstruct [
    :code,
    :created_at,
    :external_subscription_id,
    :lago_customer_id,
    :lago_id,
    :lago_subscription_id,
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
      created_at: {:union, [{:string, "date-time"}, :null]},
      external_subscription_id: :string,
      lago_customer_id: :null,
      lago_id: {:union, [{:string, "uuid"}, :null]},
      lago_subscription_id: {:union, [{:string, "uuid"}, :null]},
      precise_total_amount_cents: {:union, [:string, :null]},
      properties: :map,
      timestamp: {:string, "date-time"},
      transaction_id: :string
    ]
  end
end
