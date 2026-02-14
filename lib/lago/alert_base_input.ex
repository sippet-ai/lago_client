defmodule Lago.AlertBaseInput do
  @moduledoc """
  Provides struct and type for a AlertBaseInput
  """

  @type t :: %__MODULE__{
          billable_metric_code: String.t() | nil,
          code: String.t() | nil,
          name: String.t() | nil,
          thresholds: [Lago.AlertThresholdInput.t()] | nil
        }

  defstruct [:billable_metric_code, :code, :name, :thresholds]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      billable_metric_code: {:union, [:string, :null]},
      code: :string,
      name: {:union, [:string, :null]},
      thresholds: [{Lago.AlertThresholdInput, :t}]
    ]
  end
end
