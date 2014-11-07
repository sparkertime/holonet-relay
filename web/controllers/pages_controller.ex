defmodule HolonetRelay.PagesController do
  use Phoenix.Controller

  plug :action

  def index(conn, _params) do
    redirect conn, HolonetRelay.Router.Helpers.folders_path(:show, "inbox")
  end

  def not_found(conn, _params) do
    render conn, "not_found"
  end

  def error(conn, _params) do
    render conn, "error"
  end
end

