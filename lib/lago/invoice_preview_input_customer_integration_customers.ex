defmodule Lago.InvoicePreviewInputCustomerIntegrationCustomers do
  @moduledoc """
  Provides struct and type for a InvoicePreviewInputCustomerIntegrationCustomers
  """

  @type t :: %__MODULE__{integration_code: String.t(), integration_type: String.t()}

  defstruct [:integration_code, :integration_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [integration_code: :string, integration_type: {:const, "anrok"}]
  end
end
