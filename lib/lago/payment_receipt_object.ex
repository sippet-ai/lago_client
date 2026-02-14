defmodule Lago.PaymentReceiptObject do
  @moduledoc """
  Provides struct and type for a PaymentReceiptObject
  """

  @type t :: %__MODULE__{
          created_at: DateTime.t(),
          lago_id: String.t(),
          number: String.t(),
          payment: Lago.PaymentObject.t()
        }

  defstruct [:created_at, :lago_id, :number, :payment]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, "date-time"},
      lago_id: {:string, "uuid"},
      number: :string,
      payment: {Lago.PaymentObject, :t}
    ]
  end
end
