$('.js-restaurant-detail').remove()
$('.restaurants__detail').append("<%=j render 'restaurant', restaurant: @restaurant %>")
$('.js-restaurant-loading').hide()

