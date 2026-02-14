defmodule Lago.CreditNotes do
  @moduledoc """
  Provides API endpoints related to credit notes
  """

  @default_client Lago.Client

  @doc """
  Create a credit note

  This endpoint creates a new credit note.

  ## Request Body

  **Content Types**: `application/json`

  Credit note payload
  """
  @spec create_credit_note(body :: Lago.CreditNoteCreateInput.t(), opts :: keyword) ::
          {:ok, Lago.CreditNoteExtended.t()}
          | {:error,
             Lago.ApiErrorBadRequest.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def create_credit_note(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Lago.CreditNotes, :create_credit_note},
      url: "/credit_notes",
      body: body,
      method: :post,
      request: [{"application/json", {Lago.CreditNoteCreateInput, :t}}],
      response: [
        {200, {Lago.CreditNoteExtended, :t}},
        {400, {Lago.ApiErrorBadRequest, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete all credit note metadata

  This endpoint removes all metadata from a credit note.
  """
  @spec delete_all_credit_note_metadata(lago_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.CreditNoteMetadataResponse.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def delete_all_credit_note_metadata(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {Lago.CreditNotes, :delete_all_credit_note_metadata},
      url: "/credit_notes/#{lago_id}/metadata",
      method: :delete,
      response: [
        {200, {Lago.CreditNoteMetadataResponse, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete a metadata key

  This endpoint removes a single metadata key from a credit note.
  """
  @spec delete_credit_note_metadata_key(lago_id :: String.t(), key :: String.t(), opts :: keyword) ::
          {:ok, Lago.CreditNoteMetadataResponse.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def delete_credit_note_metadata_key(lago_id, key, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id, key: key],
      call: {Lago.CreditNotes, :delete_credit_note_metadata_key},
      url: "/credit_notes/#{lago_id}/metadata/#{key}",
      method: :delete,
      response: [
        {200, {Lago.CreditNoteMetadataResponse, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Download a credit note PDF

  This endpoint downloads the PDF of an existing credit note.
  """
  @spec download_credit_note(lago_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.CreditNote.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def download_credit_note(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {Lago.CreditNotes, :download_credit_note},
      url: "/credit_notes/#{lago_id}/download",
      method: :post,
      response: [
        {200, {Lago.CreditNote, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Estimate amounts for a new credit note

  This endpoint allows you to retrieve amounts for a new credit note creation.

  ## Request Body

  **Content Types**: `application/json`

  Credit note estimate payload
  """
  @spec estimate_credit_note(body :: Lago.CreditNoteEstimateInput.t(), opts :: keyword) ::
          {:ok, Lago.CreditNoteEstimated.t()}
          | {:error,
             Lago.ApiErrorBadRequest.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def estimate_credit_note(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Lago.CreditNotes, :estimate_credit_note},
      url: "/credit_notes/estimate",
      body: body,
      method: :post,
      request: [{"application/json", {Lago.CreditNoteEstimateInput, :t}}],
      response: [
        {200, {Lago.CreditNoteEstimated, :t}},
        {400, {Lago.ApiErrorBadRequest, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List all credit notes

  This endpoint list all existing credit notes.

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.
    * `external_customer_id`: Unique identifier assigned to the customer in your application.
    * `issuing_date_from`: Filter credit notes starting from a specific date.
    * `issuing_date_to`: Filter credit notes up to a specific date.
    * `search_term`: Search credit notes by id, number, customer name, customer external_id or customer email.
    * `currency`: Filter credit notes by currency. Possible values ISO 4217 currency codes.
    * `reason`: Filter credit notes by reasons. Possible values are `product_unsatisfactory`, `order_change`, `order_cancellation`, `fraudulent_charge`, `duplicated_charge` or `other`.
    * `credit_status`: Filter credit notes by credit status. Possible values are `available`, `consumed`  or `voided`.
    * `refund_status`: Filter credit notes by refund status. Possible values are `pending`, `succeeded`  or `failed`.
    * `invoice_number`: Filter credit notes by their related invoice number.
    * `amount_from`: Filter credit notes of at least a specific amount. This parameter must be defined in cents to ensure consistent handling for all currency types.
    * `amount_to`: Filter credit notes up to a specific amount. This parameter must be defined in cents to ensure consistent handling for all currency types.
    * `self_billed`: Filter credit notes belonging to a self billed invoice. Possible values are `true` or `false`.
    * `billing_entity_codes[]`: Filter credit notes by billing entity codes.

  """
  @spec find_all_credit_notes(opts :: keyword) ::
          {:ok, Lago.CreditNotesPaginated.t()} | {:error, Lago.ApiErrorUnauthorized.t()}
  def find_all_credit_notes(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :amount_from,
        :amount_to,
        :"billing_entity_codes[]",
        :credit_status,
        :currency,
        :external_customer_id,
        :invoice_number,
        :issuing_date_from,
        :issuing_date_to,
        :page,
        :per_page,
        :reason,
        :refund_status,
        :search_term,
        :self_billed
      ])

    client.request(%{
      args: [],
      call: {Lago.CreditNotes, :find_all_credit_notes},
      url: "/credit_notes",
      method: :get,
      query: query,
      response: [{200, {Lago.CreditNotesPaginated, :t}}, {401, {Lago.ApiErrorUnauthorized, :t}}],
      opts: opts
    })
  end

  @doc """
  List all customer's credit notes

  This endpoint list all existing credit notes for a customer.

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.
    * `issuing_date_from`: Filter credit notes starting from a specific date.
    * `issuing_date_to`: Filter credit notes up to a specific date.
    * `search_term`: Search credit notes by id, number, customer name, customer external_id or customer email.
    * `reason`: Filter credit notes by reasons. Possible values are `product_unsatisfactory`, `order_change`, `order_cancellation`, `fraudulent_charge`, `duplicated_charge` or `other`.
    * `credit_status`: Filter credit notes by credit status. Possible values are `available`, `consumed`  or `voided`.
    * `refund_status`: Filter credit notes by refund status. Possible values are `pending`, `succeeded`  or `failed`.
    * `invoice_number`: Filter credit notes by their related invoice number.
    * `amount_from`: Filter credit notes of at least a specific amount. This parameter must be defined in cents to ensure consistent handling for all currency types.
    * `amount_to`: Filter credit notes up to a specific amount. This parameter must be defined in cents to ensure consistent handling for all currency types.
    * `self_billed`: Filter credit notes belonging to a self billed invoice. Possible values are `true` or `false`.

  """
  @spec find_all_customer_credit_notes(external_customer_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.CreditNotesPaginated.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def find_all_customer_credit_notes(external_customer_id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :amount_from,
        :amount_to,
        :credit_status,
        :invoice_number,
        :issuing_date_from,
        :issuing_date_to,
        :page,
        :per_page,
        :reason,
        :refund_status,
        :search_term,
        :self_billed
      ])

    client.request(%{
      args: [external_customer_id: external_customer_id],
      call: {Lago.CreditNotes, :find_all_customer_credit_notes},
      url: "/customers/#{external_customer_id}/credit_notes",
      method: :get,
      query: query,
      response: [
        {200, {Lago.CreditNotesPaginated, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Retrieve a credit note

  This endpoint retrieves an existing credit note.
  """
  @spec find_credit_note(lago_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.CreditNoteExtended.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def find_credit_note(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {Lago.CreditNotes, :find_credit_note},
      url: "/credit_notes/#{lago_id}",
      method: :get,
      response: [
        {200, {Lago.CreditNoteExtended, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Merge credit note metadata

  This endpoint merges the provided metadata with existing metadata on the credit note.
  Existing keys not in the request are preserved. New keys are added, existing keys are updated.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec merge_credit_note_metadata(
          lago_id :: String.t(),
          body :: Lago.CreditNoteMetadataResponse.t(),
          opts :: keyword
        ) ::
          {:ok, Lago.CreditNoteMetadataResponse.t()}
          | {:error,
             Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def merge_credit_note_metadata(lago_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id, body: body],
      call: {Lago.CreditNotes, :merge_credit_note_metadata},
      url: "/credit_notes/#{lago_id}/metadata",
      body: body,
      method: :patch,
      request: [{"application/json", {Lago.CreditNoteMetadataResponse, :t}}],
      response: [
        {200, {Lago.CreditNoteMetadataResponse, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Replace credit note metadata

  This endpoint replaces all existing metadata on a credit note with the provided key-value pairs.
  Any existing metadata keys not included in the request will be removed.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec replace_credit_note_metadata(
          lago_id :: String.t(),
          body :: Lago.CreditNoteMetadataResponse.t(),
          opts :: keyword
        ) ::
          {:ok, Lago.CreditNoteMetadataResponse.t()}
          | {:error,
             Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def replace_credit_note_metadata(lago_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id, body: body],
      call: {Lago.CreditNotes, :replace_credit_note_metadata},
      url: "/credit_notes/#{lago_id}/metadata",
      body: body,
      method: :post,
      request: [{"application/json", {Lago.CreditNoteMetadataResponse, :t}}],
      response: [
        {200, {Lago.CreditNoteMetadataResponse, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a credit note

  This endpoint updates an existing credit note.

  ## Request Body

  **Content Types**: `application/json`

  Credit note update payload
  """
  @spec update_credit_note(
          lago_id :: String.t(),
          body :: Lago.CreditNoteUpdateInput.t(),
          opts :: keyword
        ) ::
          {:ok, Lago.CreditNoteExtended.t()}
          | {:error,
             Lago.ApiErrorBadRequest.t()
             | Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def update_credit_note(lago_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id, body: body],
      call: {Lago.CreditNotes, :update_credit_note},
      url: "/credit_notes/#{lago_id}",
      body: body,
      method: :put,
      request: [{"application/json", {Lago.CreditNoteUpdateInput, :t}}],
      response: [
        {200, {Lago.CreditNoteExtended, :t}},
        {400, {Lago.ApiErrorBadRequest, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Void available credit

  This endpoint voids the available credit linked to a specific credit note.
  """
  @spec void_credit_note(lago_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.CreditNoteExtended.t()}
          | {:error,
             Lago.ApiErrorNotAllowed.t()
             | Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()}
  def void_credit_note(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {Lago.CreditNotes, :void_credit_note},
      url: "/credit_notes/#{lago_id}/void",
      method: :put,
      response: [
        {200, {Lago.CreditNoteExtended, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}},
        {405, {Lago.ApiErrorNotAllowed, :t}}
      ],
      opts: opts
    })
  end
end
