defmodule Lago.OrganizationBillingConfiguration do
  @moduledoc """
  Provides struct and type for a OrganizationBillingConfiguration
  """

  @type t :: %__MODULE__{
          document_locale: String.t() | nil,
          invoice_footer: String.t() | nil,
          invoice_grace_period: integer | nil
        }

  defstruct [:document_locale, :invoice_footer, :invoice_grace_period]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      document_locale: :string,
      invoice_footer: {:union, [:string, :null]},
      invoice_grace_period: :integer
    ]
  end
end
