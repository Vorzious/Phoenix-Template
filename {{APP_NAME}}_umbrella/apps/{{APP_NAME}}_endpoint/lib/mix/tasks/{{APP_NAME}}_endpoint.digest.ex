defmodule Mix.Tasks.{{MODULE_NAME}}Endpoint.Digest do
  use Mix.Task
  @default_input_path ["priv/static"]
  @default_output_path "priv/static"
  @app_whitelist [:{{APP_NAME}}_endpoint]

  @shortdoc "Digests and compresses static files"
  @recursive true

  @moduledoc """
  The contents of this file are mostly copied from Mix.Tasks.Phx.Digest.
  We work with multiple phoenix application so we needed to adapt the digester slightly.
  Unfortunately most of the necessary functions are private, hence the copying.
  View https://github.com/phoenixframework/phoenix/blob/master/lib/mix/tasks/phx.digest.ex for the original file.

  Digests and compress static files.
      mix phx.digest
      mix phx.digest priv/static -o /www/public
  The first argument is the path where the static files are located. The
  `-o` option indicates the path that will be used to save the digested and
  compressed files.
  If no path is given, it will use `priv/static` as the input and output path.
  The output folder will contain:
    * the original file
    * the file compressed with gzip
    * a file containing the original file name and its digest
    * a compressed file containing the file name and its digest
    * a cache manifest file
  Example of generated files:
    * app.js
    * app.js.gz
    * app-eb0a5b9302e8d32828d8a73f137cc8f0.js
    * app-eb0a5b9302e8d32828d8a73f137cc8f0.js.gz
    * cache_manifest.json
  """

  @doc """
  form (list off): input_path:output_path_appendable
  options: -o: output path
  """
  def run(["default"]) do
    run([
        "../{{APP_NAME}}_cms/priv/static:cms", #YipYip-Scaffold-Remove-CMS
         "../{{APP_NAME}}_web/priv/static", #YipYip-Scaffold-Remove-WEB
         "-o", "../{{APP_NAME}}_endpoint/priv/static"
         ])
  end
  def run(all_args) do
    if Enum.member?(@app_whitelist, Mix.Project.config()[:app]) do
      {opts, args, _} = OptionParser.parse(all_args, aliases: [o: :output])
      input_paths = args || @default_input_path
      output_path = opts[:output] || @default_output_path

      Mix.Task.run "deps.loadpaths", all_args
      {:ok, _} = Application.ensure_all_started(:phoenix)

      case {{MODULE_NAME}}Endpoint.Digester.compile(input_paths, output_path) do
        :ok ->
          # We need to call build structure so everything we have
          # generated into priv is copied to _build in case we have
          # build_embedded set to true. In case it's not true,
          # build structure is mostly a no-op, so we are fine.
          Mix.Project.build_structure()
          Mix.shell.info [:green, "Check your digested files at #{inspect output_path}"]
        {:error, :invalid_path} ->
          Mix.shell.error "The input path #{inspect input_paths} does not exist"
      end
    else
      Mix.shell.error "The #{inspect Mix.Project.config()[:app]} app is not listed in the app whitelist"
    end
  end
end