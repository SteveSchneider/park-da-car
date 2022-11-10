class Vehicle < ApplicationRecord
  belongs_to :owner
  has_many :activities
  has_one :facility

  scope :checked_out, -> { where( facility_id: nil ) }
  scope :checked_in, -> { where.not( facility_id: nil ) }

  validates :vin, length: {is: 17}

  ACTIVITY_TYPES = {"O" => "Check Out", "I"=> "Check In"}.freeze

  def checked_out?
    self.facility.blank?
  end

  def checked_in?
    self.facility.present?
  end

  def facility
    return Facility.find(self&.facility_id) if self.facility_id
    nil
  end

  def last_activity_time
    last_activity&.time&.strftime("%Y/%m/%d %I:%M:%S %p")
  end

  def last_activity_type
    ACTIVITY_TYPES[last_activity&.activity_type]
  end

  private

  def last_activity
    Activity.where(vehicle_id: self.id)&.last
  end
end
