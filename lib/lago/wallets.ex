defmodule Lago.Wallets do
  @moduledoc """
  Provides API endpoints related to wallets
  """

  @default_client Lago.Client

  @doc """
  Create a wallet

  This endpoint is used to create a wallet with prepaid credits.

  ## Request Body

  **Content Types**: `application/json`

  Wallet payload
  """
  @spec create_wallet(body :: Lago.WalletCreateInput.t(), opts :: keyword) ::
          {:ok, Lago.Wallet.t()}
          | {:error,
             Lago.ApiErrorBadRequest.t()
             | Lago.ApiErrorForbidden.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def create_wallet(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Lago.Wallets, :create_wallet},
      url: "/wallets",
      body: body,
      method: :post,
      request: [{"application/json", {Lago.WalletCreateInput, :t}}],
      response: [
        {200, {Lago.Wallet, :t}},
        {400, {Lago.ApiErrorBadRequest, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {403, {Lago.ApiErrorForbidden, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Top up a wallet

  This endpoint is used to top-up an active wallet.

  ## Request Body

  **Content Types**: `application/json`

  Wallet transaction payload
  """
  @spec create_wallet_transaction(body :: Lago.WalletTransactionCreateInput.t(), opts :: keyword) ::
          {:ok, Lago.WalletTransactions.t()}
          | {:error,
             Lago.ApiErrorBadRequest.t()
             | Lago.ApiErrorForbidden.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def create_wallet_transaction(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Lago.Wallets, :create_wallet_transaction},
      url: "/wallet_transactions",
      body: body,
      method: :post,
      request: [{"application/json", {Lago.WalletTransactionCreateInput, :t}}],
      response: [
        {200, {Lago.WalletTransactions, :t}},
        {400, {Lago.ApiErrorBadRequest, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {403, {Lago.ApiErrorForbidden, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete all wallet metadata

  This endpoint removes all metadata from a wallet.
  """
  @spec delete_all_wallet_metadata(lago_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.WalletMetadataResponse.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def delete_all_wallet_metadata(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {Lago.Wallets, :delete_all_wallet_metadata},
      url: "/wallets/#{lago_id}/metadata",
      method: :delete,
      response: [
        {200, {Lago.WalletMetadataResponse, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete a metadata key

  This endpoint removes a single metadata key from a wallet.
  """
  @spec delete_wallet_metadata_key(lago_id :: String.t(), key :: String.t(), opts :: keyword) ::
          {:ok, Lago.WalletMetadataResponse.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def delete_wallet_metadata_key(lago_id, key, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id, key: key],
      call: {Lago.Wallets, :delete_wallet_metadata_key},
      url: "/wallets/#{lago_id}/metadata/#{key}",
      method: :delete,
      response: [
        {200, {Lago.WalletMetadataResponse, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Terminate a wallet

  This endpoint is used to terminate an existing wallet with prepaid credits.
  """
  @spec destroy_wallet(lago_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.Wallet.t()}
          | {:error,
             Lago.ApiErrorForbidden.t()
             | Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def destroy_wallet(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {Lago.Wallets, :destroy_wallet},
      url: "/wallets/#{lago_id}",
      method: :delete,
      response: [
        {200, {Lago.Wallet, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {403, {Lago.ApiErrorForbidden, :t}},
        {404, {Lago.ApiErrorNotFound, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List all customer's wallets

  This endpoint is used to list all wallets with prepaid credits of a customer

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.

  """
  @spec find_all_customer_wallets(external_customer_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.WalletsPaginated.t()}
          | {:error,
             Lago.ApiErrorForbidden.t()
             | Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()}
  def find_all_customer_wallets(external_customer_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [external_customer_id: external_customer_id],
      call: {Lago.Wallets, :find_all_customer_wallets},
      url: "/customers/#{external_customer_id}/wallets",
      method: :get,
      query: query,
      response: [
        {200, {Lago.WalletsPaginated, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {403, {Lago.ApiErrorForbidden, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List all wallet transactions

  This endpoint is used to list all wallet transactions.

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.
    * `status`: The status of the wallet transaction. Possible values are `pending` or `settled`.
    * `transaction_status`: The transaction status of the wallet transaction. Possible values are `purchased` (with pending or settled status), `granted` (without invoice_id), `voided` or `invoiced`.
    * `transaction_type`: The transaction type of the wallet transaction. Possible values are `inbound` (increasing the wallet balance) or `outbound` (decreasing the wallet balance).

  """
  @spec find_all_wallet_transactions(lago_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.WalletTransactionsPaginated.t()}
          | {:error,
             Lago.ApiErrorForbidden.t()
             | Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()}
  def find_all_wallet_transactions(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:page, :per_page, :status, :transaction_status, :transaction_type])

    client.request(%{
      args: [lago_id: lago_id],
      call: {Lago.Wallets, :find_all_wallet_transactions},
      url: "/wallets/#{lago_id}/wallet_transactions",
      method: :get,
      query: query,
      response: [
        {200, {Lago.WalletTransactionsPaginated, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {403, {Lago.ApiErrorForbidden, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List all wallets

  This endpoint is used to list all wallets with prepaid credits.

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.
    * `external_customer_id`: The customer external unique identifier (provided by your own application).

  """
  @spec find_all_wallets(opts :: keyword) ::
          {:ok, Lago.WalletsPaginated.t()}
          | {:error, Lago.ApiErrorForbidden.t() | Lago.ApiErrorUnauthorized.t()}
  def find_all_wallets(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:external_customer_id, :page, :per_page])

    client.request(%{
      args: [],
      call: {Lago.Wallets, :find_all_wallets},
      url: "/wallets",
      method: :get,
      query: query,
      response: [
        {200, {Lago.WalletsPaginated, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {403, {Lago.ApiErrorForbidden, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Retrieve a wallet

  This endpoint is used to retrieve an existing wallet with prepaid credits.
  """
  @spec find_wallet(lago_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.Wallet.t()}
          | {:error,
             Lago.ApiErrorForbidden.t()
             | Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()}
  def find_wallet(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {Lago.Wallets, :find_wallet},
      url: "/wallets/#{lago_id}",
      method: :get,
      response: [
        {200, {Lago.Wallet, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {403, {Lago.ApiErrorForbidden, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Retrieve a wallet transaction

  This endpoint is used to retrieve a specific wallet transactions.
  """
  @spec find_wallet_transaction(lago_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.WalletTransactionObject.t()}
          | {:error,
             Lago.ApiErrorForbidden.t()
             | Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()}
  def find_wallet_transaction(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {Lago.Wallets, :find_wallet_transaction},
      url: "/wallet_transactions/#{lago_id}",
      method: :get,
      response: [
        {200, {Lago.WalletTransactionObject, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {403, {Lago.ApiErrorForbidden, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Merge wallet metadata

  This endpoint merges the provided metadata with existing metadata on the wallet.
  Existing keys not in the request are preserved. New keys are added, existing keys are updated.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec merge_wallet_metadata(
          lago_id :: String.t(),
          body :: Lago.WalletMetadataResponse.t(),
          opts :: keyword
        ) ::
          {:ok, Lago.WalletMetadataResponse.t()}
          | {:error,
             Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def merge_wallet_metadata(lago_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id, body: body],
      call: {Lago.Wallets, :merge_wallet_metadata},
      url: "/wallets/#{lago_id}/metadata",
      body: body,
      method: :patch,
      request: [{"application/json", {Lago.WalletMetadataResponse, :t}}],
      response: [
        {200, {Lago.WalletMetadataResponse, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Replace wallet metadata

  This endpoint replaces all existing metadata on a wallet with the provided key-value pairs.
  Any existing metadata keys not included in the request will be removed.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec replace_wallet_metadata(
          lago_id :: String.t(),
          body :: Lago.WalletMetadataResponse.t(),
          opts :: keyword
        ) ::
          {:ok, Lago.WalletMetadataResponse.t()}
          | {:error,
             Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def replace_wallet_metadata(lago_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id, body: body],
      call: {Lago.Wallets, :replace_wallet_metadata},
      url: "/wallets/#{lago_id}/metadata",
      body: body,
      method: :post,
      request: [{"application/json", {Lago.WalletMetadataResponse, :t}}],
      response: [
        {200, {Lago.WalletMetadataResponse, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a wallet

  This endpoint is used to update an existing wallet with prepaid credits.

  ## Request Body

  **Content Types**: `application/json`

  Wallet update payload
  """
  @spec update_wallet(lago_id :: String.t(), body :: Lago.WalletUpdateInput.t(), opts :: keyword) ::
          {:ok, Lago.Wallet.t()}
          | {:error,
             Lago.ApiErrorBadRequest.t()
             | Lago.ApiErrorForbidden.t()
             | Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def update_wallet(lago_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id, body: body],
      call: {Lago.Wallets, :update_wallet},
      url: "/wallets/#{lago_id}",
      body: body,
      method: :put,
      request: [{"application/json", {Lago.WalletUpdateInput, :t}}],
      response: [
        {200, {Lago.Wallet, :t}},
        {400, {Lago.ApiErrorBadRequest, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {403, {Lago.ApiErrorForbidden, :t}},
        {404, {Lago.ApiErrorNotFound, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Generate a payment URL

  This endpoint generates a checkout link for a specific wallet transaction.
  """
  @spec wallet_transaction_payment_url(lago_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.WalletTransactionPaymentUrl.t()}
          | {:error,
             Lago.ApiErrorForbidden.t()
             | Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def wallet_transaction_payment_url(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {Lago.Wallets, :wallet_transaction_payment_url},
      url: "/wallet_transactions/#{lago_id}/payment_url",
      method: :post,
      response: [
        {200, {Lago.WalletTransactionPaymentUrl, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {403, {Lago.ApiErrorForbidden, :t}},
        {404, {Lago.ApiErrorNotFound, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end
end
