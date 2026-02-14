defmodule Lago.CustomerChargeUsageObjectCharge do
  @moduledoc """
  Provides struct and type for a CustomerChargeUsageObjectCharge
  """

  @type t :: %__MODULE__{
          charge_model: String.t(),
          invoice_display_name: String.t() | nil,
          lago_id: String.t()
        }

  defstruct [:charge_model, :invoice_display_name, :lago_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      charge_model: {:enum, ["standard", "graduated", "package", "percentage", "volume"]},
      invoice_display_name: :string,
      lago_id: {:string, "uuid"}
    ]
  end
end
