$('.reviews__review-list-item[data-review-id=<%= @review.id %>]').replaceWith  "<%= j render 'reviews/review', review: @review %>"
