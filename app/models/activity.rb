class Activity < ApplicationRecord
  has_one :user
  belongs_to :vehicle

  validates :user_id, numericality: { only_integer: true, greater_than_or_equal_to: 1}

  accepts_nested_attributes_for :vehicle, update_only: true

  def check_out?
    self.activity_type == "O"
  end

  def check_in?
    self.activity_type == "I"
  end
end
