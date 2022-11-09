class Facility < ApplicationRecord
  has_one :vehicle

  scope :vacant, -> { where( vehicle_id: nil ) }
end
