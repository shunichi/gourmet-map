class AddReviewsCountToUsers < ActiveRecord::Migration
  def up
    add_column :users, :reviews_count, :integer, default: 0
    execute('UPDATE users SET reviews_count = (SELECT COUNT(*) FROM reviews WHERE reviews.user_id = users.id)')
  end

  def down
    remove_column :users, :reviews_count
  end
end
