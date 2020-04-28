defmodule Mix.Tasks.Scaffold.New do
  @moduledoc """

  """

  use Mix.Task

  alias Scaffold.Generator

  def run([app_name]) do
    Generator.get_files()
    |> Enum.each(fn file ->
      content = Generator.load(file)

      rendered_content =
        cond do
          String.ends_with?(file, ".ico") ->
            content

          true ->
            content
            |> EEx.eval_string(app_name: app_name, app_module: Macro.camelize(app_name))
        end

      target_path =
        Path.join([Macro.camelize(app_name), String.replace_prefix(file, "templates/", "")])

      target_path
      |> Path.dirname()
      |> File.mkdir_p!()

      File.write(target_path, rendered_content)

      Mix.shell().info("#{target_path} created.")
    end)
  end

  def run(_), do: Mix.shell().info("enter app name like *test_application*")
end
