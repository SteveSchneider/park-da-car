class Vehicle < ApplicationRecord
  belongs_to :owner

  validates :vin, length: {is: 17}
end
