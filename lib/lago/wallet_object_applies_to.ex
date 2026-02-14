defmodule Lago.WalletObjectAppliesTo do
  @moduledoc """
  Provides struct and type for a WalletObjectAppliesTo
  """

  @type t :: %__MODULE__{billable_metric_codes: [String.t()] | nil, fee_types: [String.t()] | nil}

  defstruct [:billable_metric_codes, :fee_types]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      billable_metric_codes: [:string],
      fee_types: [enum: ["charge", "subscription", "commitment"]]
    ]
  end
end
