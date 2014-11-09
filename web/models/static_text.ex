defmodule HolonetRelay.StaticText do
  def license do
    File.stream!("HOLOLICENSE") |> Enum.map &String.strip/1
  end

  def timestamp do
    File.stream!("HOLOTIMESTAMP") |> Enum.map &String.strip/1
  end
end
