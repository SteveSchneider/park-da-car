class Activity < ApplicationRecord
  has_one :user
  has_one :vehicle

  accepts_nested_attributes_for :vehicle, update_only: true

  def check_out?
    self.activity_type == "O"
  end

  def check_in?
    self.activity_type == "I"
  end
end
