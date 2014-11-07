defmodule HolonetRelay.Messages do
  def all do
    Enum.into ["inbox", "archive"], [], fn(dir) -> {dir, messages_in_directory(dir)} end
  end

  def messages_in_directory(directory) do
    case File.ls(directory) do
      {:ok, groups} -> Enum.into groups, %{}, fn (g) -> {g, messages_for_group(g, directory)} end
      {:error, _} -> %{}
    end
  end

  def messages_for_group(group, group_location) do
    search_path = Path.join([group_location, group, "*.md"])
    search_path
      |> Path.wildcard
      |> Enum.map(&extract_permalink/1)
      |> Enum.map(&load_message_from_permalink/1)
  end

  def extract_permalink(filepath) do
    [article] = Regex.run(~r/(?<=\/)[^\/]*(?=.md)/, filepath)
    [folder] = Regex.run(~r/^[^\/]*/, filepath)
    Path.join(folder, article)
  end

  def load_message_from_permalink(permalink) do
    [folder, article] = String.split(permalink, "/")
    [file_path] = Path.wildcard([folder, "/**/", "#{article}.md"])
    raw_message_lines = File.stream!(file_path) |> Enum.map &String.strip/1

    %{:file_path => file_path,
      :permalink => permalink,
      :subject => parse_subject(raw_message_lines)}
  end

  def parse_subject(message_lines) do
    Enum.find(message_lines, fn(x) -> String.starts_with?(x, "subject: ") end)
      |> String.replace("subject:", "")
      |> String.strip
  end
end
