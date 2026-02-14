defmodule Lago.ChargeFilterObject do
  @moduledoc """
  Provides struct and type for a ChargeFilterObject
  """

  @type t :: %__MODULE__{
          invoice_display_name: String.t() | nil,
          properties: Lago.ChargeProperties.t(),
          values: map
        }

  defstruct [:invoice_display_name, :properties, :values]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      invoice_display_name: {:union, [:string, :null]},
      properties: {Lago.ChargeProperties, :t},
      values: :map
    ]
  end
end
