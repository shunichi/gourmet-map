$('.js-review[data-review-id=<%= @review.id %>] .js-review-comments').append('<%= j render 'comments/comment', review: @review, comment: @comment %>')
$('.js-review[data-review-id=<%= @review.id %>] .js-new-review-comment-textarea').val('')
