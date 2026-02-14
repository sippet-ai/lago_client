defmodule Lago.EntitlementUpdateInput do
  @moduledoc """
  Provides struct and type for a EntitlementUpdateInput
  """

  @type t :: %__MODULE__{entitlements: map}

  defstruct [:entitlements]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [entitlements: :map]
  end
end
