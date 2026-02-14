defmodule Lago.CreditObjectInvoice do
  @moduledoc """
  Provides struct and type for a CreditObjectInvoice
  """

  @type t :: %__MODULE__{lago_id: String.t(), payment_status: String.t()}

  defstruct [:lago_id, :payment_status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [lago_id: {:string, "uuid"}, payment_status: {:enum, ["pending", "succeeded", "failed"]}]
  end
end
