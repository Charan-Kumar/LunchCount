class FoodCount < ActiveRecord::Base
  has_many :users
  belongs_to :users

  validates :user_id, uniqueness: { scope: :date,
    message: "should happen once per year" }

end
