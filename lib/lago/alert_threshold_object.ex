defmodule Lago.AlertThresholdObject do
  @moduledoc """
  Provides struct and type for a AlertThresholdObject
  """

  @type t :: %__MODULE__{
          code: String.t() | nil,
          recurring: boolean | nil,
          value: String.t() | nil
        }

  defstruct [:code, :recurring, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [code: {:union, [:string, :null]}, recurring: :boolean, value: :string]
  end
end
