defmodule Lago.ApiErrorBadRequest do
  @moduledoc """
  Provides struct and type for a ApiErrorBadRequest
  """

  @type t :: %__MODULE__{error: String.t(), status: integer}

  defstruct [:error, :status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [error: :string, status: {:integer, "int32"}]
  end
end
