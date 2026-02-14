defmodule Lago.CreditNote do
  @moduledoc """
  Provides struct and type for a CreditNote
  """

  @type t :: %__MODULE__{credit_note: Lago.CreditNoteObject.t()}

  defstruct [:credit_note]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [credit_note: {Lago.CreditNoteObject, :t}]
  end
end
