class Facility < ApplicationRecord
  has_one :vehicle

  scope :occupied, -> { where( 'id IN (?)', Vehicle.all.map(&:facility_id) ) }
  scope :vacant, -> { Facility.all - occupied }

  def vacant?
    v = self.class.vacant.select{ |s| self.id == s.id }
    v.count > 0
  end
end
