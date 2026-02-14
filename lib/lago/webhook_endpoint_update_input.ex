defmodule Lago.WebhookEndpointUpdateInput do
  @moduledoc """
  Provides struct and type for a WebhookEndpointUpdateInput
  """

  @type t :: %__MODULE__{
          webhook_endpoint: Lago.WebhookEndpointUpdateInputWebhookEndpoint.t() | nil
        }

  defstruct [:webhook_endpoint]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [webhook_endpoint: {Lago.WebhookEndpointUpdateInputWebhookEndpoint, :t}]
  end
end
