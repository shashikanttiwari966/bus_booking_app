class Driver < ApplicationRecord
  belongs_to :bus
  has_one_attached :image
end
