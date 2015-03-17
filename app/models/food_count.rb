class FoodCount < ActiveRecord::Base
  has_many :users
  belongs_to :users

  validates :user_id, uniqueness: { scope: :date,
    message: "should happen once per year" }

  def self.by_month()
    dt = Date.today
    bom = dt.beginning_of_month
    eom = dt.end_of_month
    sel = "Yes"
    where("date >= ? and date <= ? and selection = ?", bom, eom,sel).group(:date).count
  end

  def self.every_month(date)
    dt = Date.parse(date)
    bom = dt.beginning_of_month
    eom = dt.end_of_month
    sel = "Yes"
    where("date >= ? and date <= ? and selection = ?", bom, eom,sel).group(:date).count
  end

  def self.date_range(from,to)
    where("date >= ? and date <= ? and selection = ?", from,to,"Yes").count
  end

  # def self.user_current_month
  #   dt = Date.today
  #   bom = dt.beginning_of_month
  #   eom = dt.end_of_month
  #   current_id = User.find(current_user).id
  #   where("date >= ? and date <= ? and user_id == ?", bom, eom,current_id)
  # end

end
