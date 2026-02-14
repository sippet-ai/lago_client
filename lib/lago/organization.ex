defmodule Lago.Organization do
  @moduledoc """
  Provides struct and type for a Organization
  """

  @type t :: %__MODULE__{organization: Lago.OrganizationObject.t()}

  defstruct [:organization]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [organization: {Lago.OrganizationObject, :t}]
  end
end
