class Team < ApplicationRecord
  has_many :users, dependent: :destroy
  belongs_to :school
end
