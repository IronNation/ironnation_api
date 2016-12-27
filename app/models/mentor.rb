class Mentor < ApplicationRecord
  has_many :schools, through: :mentor_schools, dependent: :destroy
  has_many :mentor_schools
  validates :email, :github_username, :first_name, :last_name, presence: true
  validates :email, :github_username, uniqueness: true

  def name
    [first_name, last_name].join(' ')
  end
end
