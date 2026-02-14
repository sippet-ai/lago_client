defmodule Lago.ApiErrorForbidden do
  @moduledoc """
  Provides struct and type for a ApiErrorForbidden
  """

  @type t :: %__MODULE__{code: String.t(), error: String.t(), status: integer}

  defstruct [:code, :error, :status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [code: :string, error: :string, status: {:integer, "int32"}]
  end
end
