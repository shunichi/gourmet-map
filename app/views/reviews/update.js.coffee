$('.js-review[data-review-id=<%= @review.id %>]').replaceWith  "<%= j render 'reviews/review', review: @review %>"
