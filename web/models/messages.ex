defmodule HolonetRelay.Messages do
  def folders do
    Enum.map ["inbox", "archive"], fn(folder) ->
      path = "messages/#{folder}"

      %{folder: folder,
        path: path,
        message_count: message_count(path)}
    end
  end

  def groups(folder_path) do
    {:ok, groups} = File.ls(folder_path)

    Enum.map groups, fn(group) ->
      path = Path.join(folder_path, groups)

      %{group: group,
        path: path,
        message_count: message_count(path),
        message_overviews: message_overviews(path)}
    end
  end

  def message_overviews(group_path) do
    {:ok, message_files} = File.ls(group_path)

    Enum.map message_files, fn(message_file) ->
      path = Path.join(group_path, message_file)

      %{permalink: String.replace(message_file, ~r/.txt/, ""),
        path: path,
        subject: message_subject(path)}
    end
  end

  def message_subject(message_path) do
    message_lines = File.stream!(message_path) |> Enum.map &String.strip/1

    Enum.find(message_lines, fn(x) -> String.starts_with?(x, "subject: ") end)
      |> String.replace("subject:", "")
      |> String.strip
  end

  def message_count(base_path) do
    Enum.count(Path.wildcard([base_path, "/**/", "*.txt"]))
  end
end
