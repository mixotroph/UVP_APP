jQuery ->
  $("div[contenteditable='true'][id]").each ->
    content_id = $(this).attr("id")
    field = $(this).attr("data-column")
    cke_id = $(this).attr("cke_id")
    CKEDITOR.inline content_id,
      on:
        blur: (event) ->
          data = event.editor.getData()
          request = $.ajax(
            type: 'POST'
            url: 'update_inline_content'
            dataType: 'json'
            data: { uvp: {uvp_id: content_id, column: field, data: data, cke_id: cke_id} }

          )
    return