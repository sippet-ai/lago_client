defmodule Lago.ActivityLogsPaginated do
  @moduledoc """
  Provides struct and type for a ActivityLogsPaginated
  """

  @type t :: %__MODULE__{
          activity_logs: [Lago.ActivityLogObject.t()],
          meta: Lago.PaginationMeta.t()
        }

  defstruct [:activity_logs, :meta]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [activity_logs: [{Lago.ActivityLogObject, :t}], meta: {Lago.PaginationMeta, :t}]
  end
end
