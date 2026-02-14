defmodule Lago.Organizations do
  @moduledoc """
  Provides API endpoint related to organizations
  """

  @default_client Lago.Client

  @doc """
  Update your organization

  This endpoint is used to update your own organization's settings.

  ## Request Body

  **Content Types**: `application/json`

  Update an existing organization
  """
  @spec update_organization(body :: Lago.OrganizationUpdateInput.t(), opts :: keyword) ::
          {:ok, Lago.Organization.t()}
          | {:error,
             Lago.ApiErrorBadRequest.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def update_organization(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Lago.Organizations, :update_organization},
      url: "/organizations",
      body: body,
      method: :put,
      request: [{"application/json", {Lago.OrganizationUpdateInput, :t}}],
      response: [
        {200, {Lago.Organization, :t}},
        {400, {Lago.ApiErrorBadRequest, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end
end
