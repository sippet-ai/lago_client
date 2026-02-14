defmodule Lago.WebhookEndpoint do
  @moduledoc """
  Provides struct and type for a WebhookEndpoint
  """

  @type t :: %__MODULE__{webhook_endpoint: Lago.WebhookEndpointObject.t()}

  defstruct [:webhook_endpoint]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [webhook_endpoint: {Lago.WebhookEndpointObject, :t}]
  end
end
