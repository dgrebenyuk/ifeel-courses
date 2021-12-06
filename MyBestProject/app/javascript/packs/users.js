import { Modal } from 'bootstrap'

console.log('Hello')
$(document).on('turbolinks:load', () => {
  var userModal = new Modal($('#user-modal'))

  $('.modal-toggle').on('click', (event) => {
    event.preventDefault()
    let $el = $(event.target)

    $.get($el.attr('href'), (data) => {
      $('#user-modal .modal-body').html(data)
      userModal.show()
    })
  })

  $('#user-modal').on('ajax:success', 'form', (e) => {
    console.log('Form Submitted')
    let id = $(e.currentTarget).data('id')

    $(`tr#row-${id}`).replaceWith(e.detail[0])
    userModal.hide()
  })
})
