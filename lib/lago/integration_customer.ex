defmodule Lago.IntegrationCustomer do
  @moduledoc """
  Provides struct and type for a IntegrationCustomer
  """

  @type t :: %__MODULE__{
          email: String.t() | nil,
          external_customer_id: String.t(),
          integration_code: String.t(),
          lago_id: String.t(),
          subsidiary_id: String.t() | nil,
          sync_with_provider: boolean | nil,
          targeted_object: String.t() | nil,
          type: String.t()
        }

  defstruct [
    :email,
    :external_customer_id,
    :integration_code,
    :lago_id,
    :subsidiary_id,
    :sync_with_provider,
    :targeted_object,
    :type
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      email: {:union, [:string, :null]},
      external_customer_id: :string,
      integration_code: :string,
      lago_id: {:string, "uuid"},
      subsidiary_id: :string,
      sync_with_provider: {:union, [:boolean, :null]},
      targeted_object: {:union, [:string, :null]},
      type: {:enum, ["netsuite", "anrok", "xero", "hubspot", "salesforce"]}
    ]
  end
end
