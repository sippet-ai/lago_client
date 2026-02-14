defmodule Lago.ActivityLogObject do
  @moduledoc """
  Provides struct and type for a ActivityLogObject
  """

  @type t :: %__MODULE__{
          activity_id: String.t(),
          activity_object: map | nil,
          activity_object_changes: map | nil,
          activity_source: String.t(),
          activity_type: String.t(),
          created_at: DateTime.t(),
          external_customer_id: String.t() | nil,
          external_subscription_id: String.t() | nil,
          logged_at: DateTime.t(),
          organization_id: String.t(),
          resource_id: String.t(),
          resource_type: String.t(),
          user_email: String.t() | nil
        }

  defstruct [
    :activity_id,
    :activity_object,
    :activity_object_changes,
    :activity_source,
    :activity_type,
    :created_at,
    :external_customer_id,
    :external_subscription_id,
    :logged_at,
    :organization_id,
    :resource_id,
    :resource_type,
    :user_email
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      activity_id: {:string, "uuid"},
      activity_object: {:union, [:map, :null]},
      activity_object_changes: {:union, [:map, :null]},
      activity_source: {:enum, ["api", "front", "system"]},
      activity_type: :string,
      created_at: {:string, "date-time"},
      external_customer_id: {:union, [:string, :null]},
      external_subscription_id: {:union, [:string, :null]},
      logged_at: {:string, "date-time"},
      organization_id: {:string, "uuid"},
      resource_id: {:string, "uuid"},
      resource_type: :string,
      user_email: {:union, [{:string, "email"}, :null]}
    ]
  end
end
