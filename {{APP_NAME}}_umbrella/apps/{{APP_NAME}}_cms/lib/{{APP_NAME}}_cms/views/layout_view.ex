defmodule {{MODULE_NAME}}Cms.LayoutView do
  use {{MODULE_NAME}}Cms, :view

  def get_current_path(conn) do
    conn.path_info()
  end

  def get_page_title(conn) do
    current_page = get_current_path(conn) |> List.last()

    if(current_page == "cms") do
      "Home"
    else
      current_page
    end
  end

  def get_form_title(conn) do
    current_page = get_current_path(conn) |> List.last()

    case current_page do
      "edit" -> "Edit"
      "new" -> "Create"
      _ -> "Index of"
    end
  end

  def format_breadcrumb(path) do
    current_page = path |> List.last()

    {html, _} = Enum.map_reduce(path, "/", fn(item, acc) ->
      link = Path.join(acc, item)

      html =
        if(item == current_page) do
          "<li class='active'>
            <a href='#{link}'>
              <strong>#{String.capitalize(item)}</strong>
            </a>
          </li>"
        else
          "<li>
            <a href ='#{link}'>#{String.capitalize(item)}</a>
          </li>"
        end
      {html, link}
    end)
    html
  end

  def navigation_active_parent_checker(path, navigation) do
    navigation =  navigation |> Path.split() |> Enum.filter(&(&1 != "/"))

    count_path = Enum.count(path)
    count_navigation = Enum.count(navigation)

    cond do
      count_path == count_navigation ->
        if path == navigation, do: "menu-active", else: ""
      count_navigation >= 2 && count_path > count_navigation ->
        if Enum.take(path, count_navigation) == navigation, do: "menu-active", else: ""
      true -> ""
    end
  end

  def navigation_active_checker(path, navigation) do
    navigation =  navigation |> Path.split() |> Enum.filter(&(&1 != "/"))
    if path == navigation, do: "menu-active", else: ""
  end
end
