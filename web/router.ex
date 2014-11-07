defmodule HolonetRelay.Router do
  use Phoenix.Router

  scope "/" do
    # Use the default browser stack.
    pipe_through :browser

    get "/messages/:permalink", HolonetRelay.MessagesController, :show
    get "/:folder", HolonetRelay.FoldersController, :show
    get "/", HolonetRelay.PagesController, :index
  end
end
