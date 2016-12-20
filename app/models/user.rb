class User < ApplicationRecord
  belongs_to :team, dependent: :destroy
  belongs_to :school
  validates :last_name, :first_name, :github_username, presence: true
  validates :github_username, :email, uniqueness: true


  def name
    [first_name, last_name].join(' ')
  end

end
