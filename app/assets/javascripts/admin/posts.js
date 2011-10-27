function startTinyMCE () {
    tinyMCE.init({
        mode : "textareas",
        theme : "advanced",
        plugins : "autolink,lists,spellchecker,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template",

        // Theme options
        theme_advanced_buttons1 : "bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,bullist,numlist,|,outdent,indent,blockquote,visualchars,nonbreaking,|,styleprops,spellchecker,|,cite,abbr,acronym,del,ins,attribs",
        theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,preview,|,forecolor,backcolor,|,sub,sup,|,charmap,advhr",
        theme_advanced_toolbar_location : "top",
        theme_advanced_toolbar_align : "left",
        theme_advanced_statusbar_location : "bottom",
        theme_advanced_resizing : true,
        language : "hu",
        entity_encoding : "raw",

        // Skin options
        skin : "o2k7",
        skin_variant : "silver",

        // Example content CSS (should be your site CSS)
        content_css : "/assets/posts.css",
        body_class : "post",
        widht : "580"

    // Drop lists for link/image/media/template dialogs
    //template_external_list_url : "js/template_list.js",
    //external_link_list_url : "js/link_list.js",
    //external_image_list_url : "js/image_list.js",
    //media_external_list_url : "js/media_list.js"

    });
}