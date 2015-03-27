ready = ->
  $(document).on 'click', '.js-edit-review-link', ->
    toggleReviewDisplay(this)

  $(document).on 'click', '.js-cancel-edit-review-link', ->
    form_wrapper = $(this).closest('.reviews__review-edit-form')
    form_wrapper.find('.js-review-input').val( form_wrapper.find('.js-review-body').text() )
    toggleReviewDisplay(this)

  toggleReviewDisplay = (elem) ->
    item = $(elem).closest('.reviews__review-list-item')
    targets = item.find('.js-toggle-edit-review')
    targets.toggle()


$(document).ready(ready)
$(document).on('page:load', ready)
