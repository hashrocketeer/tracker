$ ->
  class Metadata
    toggleModal: ->
      $('#modal_layer').toggle()
      $('#modal_form').toggle()
      return
    openModal: (e) ->
      row = $(e.target).closest('tr')
      type = row.data('type')
      f = $('#edit_' + type)
      action = f.attr("action")
      f.get(0).setAttribute('action', action + '/' + row.data('id'))
      f.find("input[name='" + type + "[" + type + "_name]']").val row.data('metadata')
      return

  metadata = new Metadata

  $('.modal .close').click (e) ->
    metadata.toggleModal()
    return

  $('table a.edit').click (e) ->
    metadata.openModal(e)
    metadata.toggleModal()
    return
