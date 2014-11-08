defmodule HolonetRelay.License do
  def license_text do
    File.stream!("HOLOLICENSE") |> Enum.map &String.strip/1
  end
end
