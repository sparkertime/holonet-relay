defmodule HolonetRelay.LayoutView do
  use HolonetRelay.View

  def last_updated_at do
    HolonetRelay.StaticText.timestamp
  end
end
