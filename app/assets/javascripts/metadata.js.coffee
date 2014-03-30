$ ->
  class Metadata
    toggleModal: (modal) ->
      $('#modal_layer').toggle()
      $(modal).toggle()
      return
    openModal: (e) ->
      row = $(e.target).closest('tr')
      type = row.data('type')
      f = $('#edit_' + type)
      action = f.attr("action")
      f.get(0).setAttribute('action', action + '/' + row.data('id'))
      f.find("input[name='" + type + "[" + type + "_name]']").val row.data('metadata')
      return
    confirmModal: (e) ->
      e.preventDefault()
      f = $('#confirm_delete')
      confirm = f.find('.actions .confirm')[0]
      href = e.currentTarget.getAttribute('href')
      row = $(e.target).closest('tr')
      type = row.data('type')

      f.find('.title').text('Are you sure you want to delete this ' + type + '?')
      confirm.setAttribute('href', href)
      confirm.setAttribute('data-method', 'delete')
      return

  metadata = new Metadata

  $('#modal_form .close').click (e) ->
    metadata.toggleModal('#modal_form')
    return

  $('#delete_modal .close').click (e) ->
    metadata.toggleModal('#delete_modal')
    return

  $('table a.edit').click (e) ->
    metadata.openModal(e)
    metadata.toggleModal('#modal_form')
    return

  $('table a.remove').click (e) ->
    metadata.confirmModal(e)
    metadata.toggleModal('#delete_modal')
    return
