defmodule Lago.SubscriptionsPaginated do
  @moduledoc """
  Provides struct and type for a SubscriptionsPaginated
  """

  @type t :: %__MODULE__{
          meta: Lago.PaginationMeta.t(),
          subscriptions: [Lago.SubscriptionObject.t()]
        }

  defstruct [:meta, :subscriptions]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [meta: {Lago.PaginationMeta, :t}, subscriptions: [{Lago.SubscriptionObject, :t}]]
  end
end
