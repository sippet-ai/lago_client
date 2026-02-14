defmodule Lago.CreditObjectItem do
  @moduledoc """
  Provides struct and type for a CreditObjectItem
  """

  @type t :: %__MODULE__{
          code: String.t(),
          lago_item_id: String.t(),
          name: String.t(),
          type: String.t()
        }

  defstruct [:code, :lago_item_id, :name, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code: :string,
      lago_item_id: {:string, "uuid"},
      name: :string,
      type: {:enum, ["coupon", "credit_note", "invoice"]}
    ]
  end
end
