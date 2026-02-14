defmodule Lago.CreditNoteUpdateInputCreditNote do
  @moduledoc """
  Provides struct and type for a CreditNoteUpdateInputCreditNote
  """

  @type t :: %__MODULE__{metadata: map | nil, refund_status: String.t()}

  defstruct [:metadata, :refund_status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [metadata: :map, refund_status: {:enum, ["pending", "succeeded", "failed"]}]
  end
end
