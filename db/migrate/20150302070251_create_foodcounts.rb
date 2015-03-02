class CreateFoodcounts < ActiveRecord::Migration
  def change
    create_table :foodcounts do |t|
      t.integer :user_id
      t.date  :date
      t.string :user_value
      t.timestamps
    end
  end
end
