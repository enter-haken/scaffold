defmodule Scaffold.Generator do
  files =
    Path.wildcard("templates/**", match_dot: true)
    |> Enum.filter(fn x ->
      case File.stat!(x) do
        %File.Stat{
          type: :regular
        } ->
          true

        _ ->
          false
      end
    end)

  def get_files(), do: unquote(files)

  for filename <- files do
    def load(unquote(filename)), do: unquote(File.read!(filename))
  end
end
