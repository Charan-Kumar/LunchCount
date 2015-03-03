class CreateFoodCounts < ActiveRecord::Migration
  def change
    create_table :food_counts do |t|
      t.integer :user_id
      t.date :date
      t.string :selection

      t.timestamps
    end
  end
end
