class Airport < ApplicationRecord
  validates :name, presence: true
  has_many :trips
end
