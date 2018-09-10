$(document).ready(function(){
    // Add summernote
    $(".summernote").summernote({
        minHeight: '300px',
        toolbar: [
            ['style', ['style', 'bold', 'italic', 'underline', 'clear', 'strikethrough']],
            ['fontsize', ['fontsize']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['color', ['color']],
            ['insert', ['link']],
            ['extra', ['fullscreen']]
        ],
        tooltip: false
    });
});