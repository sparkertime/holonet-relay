defmodule HolonetRelay.FoldersController do
  use Phoenix.Controller

  plug :action

  def show(conn, params) do
    folders = HolonetRelay.Messages.folders
    open_folder = Enum.find folders, fn (x) -> x[:folder] == params["folder"] end
    groups = HolonetRelay.Messages.groups(open_folder[:path])

    render conn, "show.html",
      folders: HolonetRelay.Messages.folders,
      open_folder: open_folder,
      groups: groups,
      license: HolonetRelay.License.license_text
  end
end
