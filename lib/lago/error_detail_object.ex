defmodule Lago.ErrorDetailObject do
  @moduledoc """
  Provides struct and type for a ErrorDetailObject
  """

  @type t :: %__MODULE__{details: map, error_code: String.t(), lago_id: String.t() | nil}

  defstruct [:details, :error_code, :lago_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [details: :map, error_code: :string, lago_id: {:union, [{:string, "uuid"}, :null]}]
  end
end
