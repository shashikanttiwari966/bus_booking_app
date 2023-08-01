class Schedule < ApplicationRecord
  belongs_to :bus
  has_many :bookings
end
