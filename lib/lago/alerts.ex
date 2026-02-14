defmodule Lago.Alerts do
  @moduledoc """
  Provides struct and type for a Alerts
  """

  @type t :: %__MODULE__{alerts: [Lago.AlertObject.t()], meta: Lago.PaginationMeta.t() | nil}

  defstruct [:alerts, :meta]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [alerts: [{Lago.AlertObject, :t}], meta: {Lago.PaginationMeta, :t}]
  end
end
