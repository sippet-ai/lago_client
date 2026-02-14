defmodule Lago.Usages do
  @moduledoc """
  Provides struct and type for a Usages
  """

  @type t :: %__MODULE__{usages: [Lago.UsageObject.t()]}

  defstruct [:usages]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [usages: [{Lago.UsageObject, :t}]]
  end
end
