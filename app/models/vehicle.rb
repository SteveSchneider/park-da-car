class Vehicle < ApplicationRecord
  belongs_to :owner
  has_many :activities
  has_one :facility

  scope :checked_out, -> { where( facility_id: nil ) }
  scope :checked_in, -> { where.not( facility_id: nil ) }

  validates :vin, length: {is: 17}

  def checked_out?
    self.facility.blank?
  end

  def checked_in?
    self.facility.present?
  end

  def facility
    Facility.find(self.facility_id)
  end

  private

  def last_activity
    Activity.where(vehicle_id: self.id)&.last&.activity_type
  end
end
