defmodule Lago.EventEstimateInstantFeesInputEvent do
  @moduledoc """
  Provides struct and type for a EventEstimateInstantFeesInputEvent
  """

  @type t :: %__MODULE__{
          code: String.t(),
          external_subscription_id: String.t(),
          properties: map | nil,
          transaction_id: String.t() | nil
        }

  defstruct [:code, :external_subscription_id, :properties, :transaction_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code: :string,
      external_subscription_id: :string,
      properties: :map,
      transaction_id: {:union, [:string, :null]}
    ]
  end
end
