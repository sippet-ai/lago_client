defmodule Lago.WebhookEndpointCreateInputWebhookEndpoint do
  @moduledoc """
  Provides struct and type for a WebhookEndpointCreateInputWebhookEndpoint
  """

  @type t :: %__MODULE__{signature_algo: String.t() | nil, webhook_url: String.t()}

  defstruct [:signature_algo, :webhook_url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [signature_algo: {:enum, ["jwt", "hmac", nil]}, webhook_url: :string]
  end
end
