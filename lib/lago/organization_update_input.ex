defmodule Lago.OrganizationUpdateInput do
  @moduledoc """
  Provides struct and type for a OrganizationUpdateInput
  """

  @type t :: %__MODULE__{organization: Lago.OrganizationUpdateInputOrganization.t()}

  defstruct [:organization]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [organization: {Lago.OrganizationUpdateInputOrganization, :t}]
  end
end
