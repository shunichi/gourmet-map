$('.restaurants__detail').html("<%=j render 'restaurant', restaurant: @restaurant %>")
GRM.showInfo <%= @restaurant.id %>

