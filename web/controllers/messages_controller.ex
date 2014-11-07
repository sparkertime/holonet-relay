defmodule HolonetRelay.MessagesController do
  use Phoenix.Controller

  plug :action

  def show(conn, _params) do
    render conn, "show", folders: HolonetRelay.Messages.folders
  end
end
