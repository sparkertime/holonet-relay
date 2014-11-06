defmodule HolonetRelay.Router do
  use Phoenix.Router

  scope "/" do
    # Use the default browser stack.
    pipe_through :browser

    get "/", HolonetRelay.MessagesController, :index
    get "/messages/:id", HolonetRelay.MessagesController, :show
  end
end
