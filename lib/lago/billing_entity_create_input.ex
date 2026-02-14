defmodule Lago.BillingEntityCreateInput do
  @moduledoc """
  Provides struct and type for a BillingEntityCreateInput
  """

  @type t :: %__MODULE__{billing_entity: Lago.BillingEntityCreateInputBillingEntity.t()}

  defstruct [:billing_entity]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [billing_entity: {Lago.BillingEntityCreateInputBillingEntity, :t}]
  end
end
