class Bus < ApplicationRecord
  belongs_to :user
  has_many :bus_trips, dependent: :destroy
  has_one :bus_service, dependent: :destroy
  has_many :drivers, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :seats, dependent: :destroy
  has_many :schedules, dependent: :destroy
  has_one_attached :image
  accepts_nested_attributes_for :bus_trips, allow_destroy: true, reject_if: proc { |att| att['pickup_location'].blank? || ['destination_location'].blank?}

  after_create do
    (Date.today..Date.today + 30.days).each do |date|
      self.schedules.create(trip_date: date, available_seat: self.total_seat)
    end

    for i in 1..self.total_seat do
      self.seats.create(name: "A#{i}")
    end
  end
end