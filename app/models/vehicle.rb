class Vehicle < ApplicationRecord
  belongs_to :owner
  has_many :activities
  has_one :facility

  scope :checked_out, -> { where( activity_type: "O" ) }
  scope :checked_in, -> { where( activity_type: "I" ) }

  validates :vin, length: {is: 17}

  def checked_out?
    return true if last_activity == "O"
    return false
  end

  def checked_in?
    return true if last_activity == "I"
    return false
  end

  private

  def last_activity
    Activity.where(vehicle_id: self.id)&.last&.activity_type
  end
end
