defmodule Lago.ApiErrorUnprocessableEntity do
  @moduledoc """
  Provides struct and type for a ApiErrorUnprocessableEntity
  """

  @type t :: %__MODULE__{code: String.t(), error: String.t(), error_details: map, status: integer}

  defstruct [:code, :error, :error_details, :status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [code: :string, error: :string, error_details: :map, status: {:integer, "int32"}]
  end
end
