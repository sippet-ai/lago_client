defmodule Lago.FeeEstimateObjectItem do
  @moduledoc """
  Provides struct and type for a FeeEstimateObjectItem
  """

  @type t :: %__MODULE__{
          code: String.t(),
          description: String.t() | nil,
          filter_invoice_display_name: String.t() | nil,
          filters: map | nil,
          grouped_by: map | nil,
          invoice_display_name: String.t() | nil,
          item_type: String.t(),
          lago_item_id: String.t(),
          name: String.t(),
          type: String.t()
        }

  defstruct [
    :code,
    :description,
    :filter_invoice_display_name,
    :filters,
    :grouped_by,
    :invoice_display_name,
    :item_type,
    :lago_item_id,
    :name,
    :type
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code: :string,
      description: :string,
      filter_invoice_display_name: {:union, [:string, :null]},
      filters: {:union, [:map, :null]},
      grouped_by: :map,
      invoice_display_name: :string,
      item_type: {:const, "BillableMetric"},
      lago_item_id: {:string, "uuid"},
      name: :string,
      type: {:const, "charge"}
    ]
  end
end
