$('.reviews__review-list-item[data-review-id=<%= @review.id %>]').replaceWith
  "<%= j render 'review/review', review: @review %>"
