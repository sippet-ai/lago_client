defmodule Lago.AlertBatchCreateInput do
  @moduledoc """
  Provides struct and type for a AlertBatchCreateInput
  """

  @type t :: %__MODULE__{alerts: [Lago.AlertBatchCreateInputAlerts.t()]}

  defstruct [:alerts]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [alerts: [{Lago.AlertBatchCreateInputAlerts, :t}]]
  end
end
