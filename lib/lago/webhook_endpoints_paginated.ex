defmodule Lago.WebhookEndpointsPaginated do
  @moduledoc """
  Provides struct and type for a WebhookEndpointsPaginated
  """

  @type t :: %__MODULE__{
          meta: Lago.PaginationMeta.t(),
          webhook_endpoints: [Lago.WebhookEndpointObject.t()]
        }

  defstruct [:meta, :webhook_endpoints]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [meta: {Lago.PaginationMeta, :t}, webhook_endpoints: [{Lago.WebhookEndpointObject, :t}]]
  end
end
