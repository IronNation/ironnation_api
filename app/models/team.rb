class Team < ApplicationRecord
  has_many :users, dependent: :destroy
  belongs_to :school
  validates :uid, uniqueness: true

  ratyrate_rateable "tech", "creativity", "real_world_application"

  def overall_average(team)
    rating = Rate.where(rateable: team).pluck('stars')
   (rating.reduce(:+).to_f / rating.size).round(1)
  end



end
