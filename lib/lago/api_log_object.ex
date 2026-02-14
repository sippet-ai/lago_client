defmodule Lago.ApiLogObject do
  @moduledoc """
  Provides struct and type for a ApiLogObject
  """

  @type t :: %__MODULE__{
          api_version: String.t(),
          client: String.t(),
          created_at: DateTime.t(),
          http_method: String.t(),
          http_status: integer,
          logged_at: DateTime.t(),
          request_body: String.t(),
          request_id: String.t(),
          request_origin: String.t(),
          request_path: String.t(),
          request_response: String.t() | nil
        }

  defstruct [
    :api_version,
    :client,
    :created_at,
    :http_method,
    :http_status,
    :logged_at,
    :request_body,
    :request_id,
    :request_origin,
    :request_path,
    :request_response
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      api_version: :string,
      client: :string,
      created_at: {:string, "date-time"},
      http_method: {:enum, ["post", "put", "delete"]},
      http_status: :integer,
      logged_at: {:string, "date-time"},
      request_body: {:string, "object"},
      request_id: {:string, "uuid"},
      request_origin: :string,
      request_path: :string,
      request_response: {:string, "object"}
    ]
  end
end
