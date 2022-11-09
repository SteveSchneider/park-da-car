class Owner < ApplicationRecord
  has_many :vehicle

  def to_s
    %Q(#{self.name})
  end
end
