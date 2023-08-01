class Booking < ApplicationRecord
  belongs_to :schedule
  belongs_to :bus
  has_many :passengers
  accepts_nested_attributes_for :passengers, allow_destroy: true, reject_if: proc { |att| att['first_name'].blank? || ['last_name'].blank? || ['contact_no'].blank? || ['address'].blank? || ['age'].blank?}
end
