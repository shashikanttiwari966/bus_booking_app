class Seat < ApplicationRecord
  enum seat_type: ['general', 'sleeper']
  belongs_to :bus
end
