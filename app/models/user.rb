class User < ApplicationRecord
  belongs_to :team
  belongs_to :school
  validates :email, uniqueness: true


  def name
    [first_name, last_name].join(' ')
  end

end
