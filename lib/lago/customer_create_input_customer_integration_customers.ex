defmodule Lago.CustomerCreateInputCustomerIntegrationCustomers do
  @moduledoc """
  Provides struct and type for a CustomerCreateInputCustomerIntegrationCustomers
  """

  @type t :: %__MODULE__{
          external_customer_id: String.t() | nil,
          id: String.t() | nil,
          integration_code: String.t() | nil,
          integration_type: String.t() | nil,
          subsidiary_id: String.t() | nil,
          sync_with_provider: boolean | nil
        }

  defstruct [
    :external_customer_id,
    :id,
    :integration_code,
    :integration_type,
    :subsidiary_id,
    :sync_with_provider
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      external_customer_id: :string,
      id: {:string, "uuid"},
      integration_code: :string,
      integration_type: {:enum, ["netsuite", "anrok", "xero"]},
      subsidiary_id: :string,
      sync_with_provider: :boolean
    ]
  end
end
