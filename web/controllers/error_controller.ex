defmodule HolonetRelay.ErrorController do
  use Phoenix.Controller

  plug :action

  def not_found(conn, _params) do
    render conn, "not_found"
  end

  def error(conn, _params) do
    render conn, "error"
  end
end

