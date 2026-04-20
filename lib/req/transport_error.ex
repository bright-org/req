defmodule Req.TransportError do
  @moduledoc """
  Represents an error with the transport used by an HTTP connection.

  This is a standardised exception that all Req adapters should use for transport-layer-related
  errors.

  This exception is based on `Mint.TransportError`.
  """

  defexception [:reason]

  @impl true
  def message(%__MODULE__{reason: {:ex_tcp, detail}}) do
    "ex_tcp: " <> IO.chardata_to_string(detail)
  end

  def message(%__MODULE__{reason: reason}) do
    Mint.TransportError.message(%Mint.TransportError{reason: reason})
  end
end
