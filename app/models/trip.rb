class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :airport
  has_many :ride_mates
end
