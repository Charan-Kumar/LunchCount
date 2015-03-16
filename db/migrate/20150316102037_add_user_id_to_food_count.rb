class AddUserIdToFoodCount < ActiveRecord::Migration
  def change
   add_column :users, :food_counts_id, :integer
  end
end
