$(".restaurants__detail-reviews[data-restaurant-id=<%= @restaurant.id %>]").prepend "<%= j render 'reviews/review', review: @review %>"
$(".js-new-review-textarea").val("")
