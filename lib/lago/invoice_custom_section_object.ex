defmodule Lago.InvoiceCustomSectionObject do
  @moduledoc """
  Provides struct and type for a InvoiceCustomSectionObject
  """

  @type t :: %__MODULE__{
          applied_to_organization: boolean | nil,
          code: String.t(),
          created_at: DateTime.t() | nil,
          description: String.t() | nil,
          details: String.t() | nil,
          display_name: String.t() | nil,
          lago_id: String.t(),
          name: String.t(),
          organization_id: String.t() | nil
        }

  defstruct [
    :applied_to_organization,
    :code,
    :created_at,
    :description,
    :details,
    :display_name,
    :lago_id,
    :name,
    :organization_id
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      applied_to_organization: :boolean,
      code: :string,
      created_at: {:string, "date-time"},
      description: :string,
      details: :string,
      display_name: :string,
      lago_id: {:string, "uuid"},
      name: :string,
      organization_id: {:string, "uuid"}
    ]
  end
end
