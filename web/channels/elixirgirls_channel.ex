defmodule Slackir.ElixirGirlsChannel do
  use Slackir.Web, :channel
  alias Slackir.{Message}

  def join("random:lobby", payload, socket) do
    if authorized?(payload) do
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (random:lobby).
  def handle_in("new_message", message, socket) do
    changeset = Message.changeset(%Message{}, message)

    if changeset.valid? do
      Repo.insert!(changeset)
      broadcast socket, "new_message", message
      {:reply, :ok, socket}
    else
      {:reply, :error, socket}
    end
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
