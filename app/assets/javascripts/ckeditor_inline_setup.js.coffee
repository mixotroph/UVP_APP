jQuery ->
  $("div[contenteditable='true'][id]").each ->
    content_id = $(this).attr("id")
    field = $(this).attr("data-column")
    console.log(field)
    console.log(content_id)
    CKEDITOR.inline content_id,
      on:
        blur: (event) ->
          console.log("check blur")
          data = event.editor.getData()
          request = $.ajax(
            type: 'POST'
            url: 'update_inline_content'
            dataType: 'json'
            data: { uvp: {uvp_id: content_id, column: field, data: data } }

          )
    return