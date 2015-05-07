class AddReviewsCountToRestaurants < ActiveRecord::Migration
  def up
    add_column :restaurants, :reviews_count, :integer, defaut: 0
    execute('UPDATE restaurants SET reviews_count = (SELECT COUNT(*) FROM reviews where reviews.restaurant_id = restaurants.id)')
  end

  def down
    remove_column :restaurants, :reviews_count
  end
end
