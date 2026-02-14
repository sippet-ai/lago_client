defmodule Lago.CreditNoteExtended do
  @moduledoc """
  Provides struct and type for a CreditNoteExtended
  """

  @type t :: %__MODULE__{credit_note: Lago.CreditNoteExtendedObject.t()}

  defstruct [:credit_note]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [credit_note: {Lago.CreditNoteExtendedObject, :t}]
  end
end
