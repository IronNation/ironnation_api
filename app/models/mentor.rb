class Mentor < ApplicationRecord
  has_many :schools, through: :mentor_schools
  has_many :mentor_schools
end
