defmodule {{MODULE_NAME}}Web.ErrorViewTest do
  use {{MODULE_NAME}}Web.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders 404.html" do
    assert render_to_string({{MODULE_NAME}}Web.ErrorView, "404.html", []) ==
           "Page not found"
  end

  test "render 500.html" do
    assert render_to_string({{MODULE_NAME}}Web.ErrorView, "500.html", []) ==
           "Internal server error"
  end

  test "render any other" do
    assert render_to_string({{MODULE_NAME}}Web.ErrorView, "505.html", []) ==
           "Internal server error"
  end
end
