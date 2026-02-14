defmodule Lago.ApiLogsPaginated do
  @moduledoc """
  Provides struct and type for a ApiLogsPaginated
  """

  @type t :: %__MODULE__{api_logs: [Lago.ApiLogObject.t()], meta: Lago.PaginationMeta.t()}

  defstruct [:api_logs, :meta]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [api_logs: [{Lago.ApiLogObject, :t}], meta: {Lago.PaginationMeta, :t}]
  end
end
