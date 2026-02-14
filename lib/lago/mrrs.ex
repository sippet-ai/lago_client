defmodule Lago.Mrrs do
  @moduledoc """
  Provides struct and type for a Mrrs
  """

  @type t :: %__MODULE__{mrrs: [Lago.MrrObject.t()]}

  defstruct [:mrrs]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [mrrs: [{Lago.MrrObject, :t}]]
  end
end
