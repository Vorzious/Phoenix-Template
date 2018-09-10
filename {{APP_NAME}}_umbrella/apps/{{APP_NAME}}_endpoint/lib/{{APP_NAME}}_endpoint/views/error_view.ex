defmodule {{MODULE_NAME}}Endpoint.ErrorView do
  use {{MODULE_NAME}}Endpoint, :view

  def render(template, assigns) do
    case assigns.conn.path_info do
      ["api" | _] ->  render({{MODULE_NAME}}Api.ErrorView, template, assigns) #YipYip-Scaffold-Remove-API
      ["cms" | _] -> render({{MODULE_NAME}}Cms.ErrorView, template, Map.merge(assigns, %{layout: {{{MODULE_NAME}}Cms.LayoutView, "error.html"}})) #YipYip-Scaffold-Remove-CMS
      _ -> render({{MODULE_NAME}}Web.ErrorView, template, Map.merge(assigns, %{layout: {{{MODULE_NAME}}Web.LayoutView, "error.html"}})) #YipYip-Scaffold-Remove-WEB
    end
  end

end
