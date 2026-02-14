defmodule Lago.WebhookEndpointCreateInput do
  @moduledoc """
  Provides struct and type for a WebhookEndpointCreateInput
  """

  @type t :: %__MODULE__{
          webhook_endpoint: Lago.WebhookEndpointCreateInputWebhookEndpoint.t() | nil
        }

  defstruct [:webhook_endpoint]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [webhook_endpoint: {Lago.WebhookEndpointCreateInputWebhookEndpoint, :t}]
  end
end
