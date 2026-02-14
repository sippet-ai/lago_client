defmodule Lago.EventEstimateFeesInputEvent do
  @moduledoc """
  Provides struct and type for a EventEstimateFeesInputEvent
  """

  @type t :: %__MODULE__{
          code: String.t(),
          external_subscription_id: String.t(),
          properties: map | nil
        }

  defstruct [:code, :external_subscription_id, :properties]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [code: :string, external_subscription_id: :string, properties: :map]
  end
end
