defmodule Lago.ActivityLog do
  @moduledoc """
  Provides struct and type for a ActivityLog
  """

  @type t :: %__MODULE__{activity_log: Lago.ActivityLogObject.t()}

  defstruct [:activity_log]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [activity_log: {Lago.ActivityLogObject, :t}]
  end
end
