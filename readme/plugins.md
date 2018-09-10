# README'S
<!-- TOC -->

- [README'S](#readmes)
    - [Plugins Usage](#plugins-usage)
        - [Datatables](#datatables)
        - [Summernote](#summernote)
        - [Flatpickr](#flatpickr)
        - [Pretty Checkbox](#pretty-checkbox)

<!-- /TOC -->

## Plugins Usage
### Datatables
There are two kinds of datatables directly available when using the YipYip Phoenix Template. Namely the standard datatable and an a-synchronous datatable using ajax.

To initialise the standard datatable give a table the class `datatable`.

```html

<!-- Example Standard Datatable -->
<table class="table table-striped table-bordered table-hover datatable">
    <!-- Table Elements -->
</table>
```

To initialise an a-synchronous datatable you will need the following HTML elements

```html
<!-- HTML -->
<!-- First, add the 'datatable-ajax' class to the table element -->
<table class="table table-striped table-bordered table-hover datatable-ajax">
..
</table>

<!--
    - Second, add the data element 'data-resource' to the table element

    - The data-resource needs to have the same name as yo ur database table name

    - e.g. If your database name is 'users', make sure the value of data-resource is 'users'.    
-->

<table data-resource="DATABASE_TABLE" class="table table-striped table-bordered table-hover datatable-ajax">
..
</table>

<!-- 
    - Next add the data elements 'data-column-name' to the th's in the thead

    - The data-column-name needs to have the same name as the column inside of the database table.

    - e.g. If you database name is 'users' with a column 'username', make sure the value of data-column-name is 'username'.

    - Finally add the data-column-name="options", this column will contain the "show" and "edit" buttons on in the final column.
-->

<table data-resource="DATABASE_TABLE" class="table table-striped table-bordered table-hover datatable-ajax">
    <thead>
        <tr>
            <th data-column-name="DB_FIELD">DB_FIELD</th>
            <th data-column-name="options">Options</th>
        </tr>
    </thead>
    <tbody>
        <!-- Leave Empty -->
    </tbody>
</table>

<!-- The tbody can be left empty as this will be overridden by the application api. -->
<!-- These settings can be found in `{{APP_NAME}}_umbrella/apps/{{APP_NAME}}_cms/assets/vendor/js/plugins/dataTables/yy_datatables.js` -->
```

```elixir
# ELIXIR
# ROUTE
# Active the /cms/api route in your router.ex file

scope "/cms/api", {{MODULE_NAME}}Cms do
    pipe_through :api

    get "/foo", FooController, :foo_api_function
end

# FOO_CONTROLLER
# Add the api function that you need
def foo_api_function(conn, params) do
    data = CONTEXT.get_all_for_datatables(params)
    render(conn, "for_datatables.json", data: data)
end

# FOO_VIEW
# Add the for_datatables render function in the view file
def render("for_datatables.json", %{data: data}) do
    %{
        draw: data.draw,
        recordsTotal: data.recordsTotal,
        recordsFiltered: data.recordsFiltered,
        data: render_many(data.data, {{MODULE_NAME}}Cms.FooView, "foo.json")
    }
end

  def render("foo.json", %{foo: foo}) do
    %{
      foo_name: foo.name,
      foo_age: foo.age,
      show_url: link(Gettext.dgettext({{MODULE_NAME}}Cms.Gettext, "default", "Show"),
        [to: foo_path({{MODULE_NAME}}Endpoint.Endpoint, :show, foo), class: "btn btn-default btn-xs"])
        |> safe_to_string() ,
      edit_url: link(Gettext.dgettext({{MODULE_NAME}}Cms.Gettext, "default", "Edit"),
        [to: foo_path({{MODULE_NAME}}Endpoint.Endpoint, :edit, foo), class: "btn btn-default btn-xs"])
        |> safe_to_string() ,
      delete_url: link(Gettext.dgettext({{MODULE_NAME}}Cms.Gettext, "default", "Delete"),
        [to: foo_path({{MODULE_NAME}}Endpoint.Endpoint, :delete, foo), class: "btn btn-danger btn-xs",
         method: :delete, data: [confirm: "Are you sure?"]])
        |> safe_to_string() ,
    }
  end
```

### Summernote
Summernote is available when using the YipYip Phoenix Template.

To add Summernote to an input field add the `summernote` class to a phoenix textarea input field as shown below.

```elixir
<%= textarea f, :foo, class: "form-control summernote" %>
```

### Flatpickr
Flatpickr is available when using the YipYip Phoenix Template.

To add Flatpickr as a date picker change the Phoenix `date_select` to `text_input` and add the `flatpickr` class to the input as shown below.

```elixir
# Replace
<%= date_select f, :foo_date, class: "form-control" %>

# with
<%= text_input f, :foo_date, class: "form-control flatpickr" %>
```

### Pretty Checkbox
Pretty Checkbox is available whn using the YipYip Phoenix Template.

To add Pretty Checkbox as a checkbox replacement add the following HTML elements:

```html
<div class="pretty success smooth">
    <%= checkbox c, :checked, class: "form-control" %>
    <label>
        <i class="fa fa-check"></i>
    </label>              
</div>
```