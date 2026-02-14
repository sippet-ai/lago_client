defmodule Lago.InvoicePreviewInputSubscriptions do
  @moduledoc """
  Provides struct and type for a InvoicePreviewInputSubscriptions
  """

  @type t :: %__MODULE__{
          external_ids: [String.t()],
          plan_code: String.t() | nil,
          terminated_at: DateTime.t() | nil
        }

  defstruct [:external_ids, :plan_code, :terminated_at]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [external_ids: [:string], plan_code: :string, terminated_at: {:string, "date-time"}]
  end
end
