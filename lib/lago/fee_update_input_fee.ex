defmodule Lago.FeeUpdateInputFee do
  @moduledoc """
  Provides struct and type for a FeeUpdateInputFee
  """

  @type t :: %__MODULE__{payment_status: String.t()}

  defstruct [:payment_status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [payment_status: {:enum, ["pending", "succeeded", "failed", "refunded"]}]
  end
end
