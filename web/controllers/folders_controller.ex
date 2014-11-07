defmodule HolonetRelay.FoldersController do
  use Phoenix.Controller

  plug :action

  def show(conn, params) do
    folders = HolonetRelay.Messages.folders
    open_folder = Enum.find folders, fn (x) -> x[:folder] == params["folder"] end
    groups = HolonetRelay.Messages.groups(open_folder[:path])

    render conn, "show", folders: HolonetRelay.Messages.folders, open_folder: open_folder, groups: groups
  end
end
