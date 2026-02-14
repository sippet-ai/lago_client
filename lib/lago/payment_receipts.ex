defmodule Lago.PaymentReceipts do
  @moduledoc """
  Provides API endpoints related to payment receipts
  """

  @default_client Lago.Client

  @doc """
  List all payment receipts

  This endpoint is used to list all existing payment receipts.

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.
    * `invoice_id`: Filter payment receipts by invoice id.

  """
  @spec find_all_payment_receipts(opts :: keyword) ::
          {:ok, Lago.PaymentReceiptsPaginated.t()} | {:error, Lago.ApiErrorUnauthorized.t()}
  def find_all_payment_receipts(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:invoice_id, :page, :per_page])

    client.request(%{
      args: [],
      call: {Lago.PaymentReceipts, :find_all_payment_receipts},
      url: "/payment_receipts",
      method: :get,
      query: query,
      response: [
        {200, {Lago.PaymentReceiptsPaginated, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Retrieve a payment receipt

  This endpoint retrieves a specific payment receipt.
  """
  @spec find_payment_receipt(lago_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.PaymentReceipt.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def find_payment_receipt(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {Lago.PaymentReceipts, :find_payment_receipt},
      url: "/payment_receipts/#{lago_id}",
      method: :get,
      response: [
        {200, {Lago.PaymentReceipt, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end
end
