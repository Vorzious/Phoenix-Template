$(document).ready(function(){
    /*
    * The synchronous datatable
    */
    $('.datatable').DataTable();


    /*
    * The a-synchronous datatable
    */
    var datatableResource = $(".datatable-ajax").data("resource");
    $(".datatable-ajax").DataTable({
        "pageLength": 25,
        "processing": true,
        "serverSide": true,
        "ajax": "/cms/api/" + datatableResource,
        "columns": 
            setDatatableColumns()
        ,
        "columnDefs": [
            {
                "targets": -1,
                "data": "edit_url",
                "defaultContent": "<span>No link found<\/span>",
                "render": function ( data, type, full, meta ) {
                    return "<span>" + full.show_url + "</span><span>" + full.edit_url + "</span>";
                }
            }
        ]
    });
});
    
/*
* Dynamically set all the columns for the Datatable to use
*/
function setDatatableColumns(){
    var columns = [];
    var ajaxTh = $(".datatable-ajax > thead > tr > th");

    ajaxTh.each(function(i){        
        var ajaxThData = $(this).data("column-name");

        if(ajaxThData == "options"){
            columns.push({
                "data": "show_url",
                "orderable": false,
                "className": "text-right"
            });
        } else{
            columns.push({"data": ajaxThData});
        }
    });
    return columns;
}