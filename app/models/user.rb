class User < ApplicationRecord
  belongs_to :team
  belongs_to :school

  def name
    [first_name, last_name].join(' ')
  end

  def city_name
    ["Houston", "San Antonio", "Austin", "Dallas", "Salt Lake City", "Las Vegas", "Tampa Bay", "Orlando", "Atlanta", "Durham", "Raleigh", "Charleston", "Charlotte", "Cincinnati", "Columbia", "Detroit", "Greenville", "Indianapolis", "Minneapolis", "Nashville", "Washington, D.C."]
  end
end
