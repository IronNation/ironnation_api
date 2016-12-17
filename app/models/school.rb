class School < ApplicationRecord
  has_many :users
  has_many :mentors, through: :mentor_schools
  has_many :mentor_schools
  has_many :teams
end
