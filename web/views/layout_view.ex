defmodule HolonetRelay.LayoutView do
  use HolonetRelay.Views

  def last_updated_at do
    {year, month, day} = HolonetRelay.Messages.newest_timestamp

    [year, month, day]
      |> Enum.map(&Integer.to_string/1)
      |> Enum.map( &(String.rjust(&1, 2, ?0)) )
      |> Enum.join("-")
  end
end
