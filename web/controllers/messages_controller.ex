defmodule HolonetRelay.MessagesController do
  use Phoenix.Controller

  plug :action

  def index(conn, _params) do
    render conn, "index", folders: HolonetRelay.Messages.folders
  end

  def show(conn, _params) do
    render conn, "show"
  end
end
