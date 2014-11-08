defmodule HolonetRelay.MessagesController do
  use Phoenix.Controller

  plug :action

  def show(conn, params) do
    message = HolonetRelay.Messages.message(params["permalink"])
    render conn, "show.html", message: message
  end
end
