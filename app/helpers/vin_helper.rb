module VinHelper
    def self.check_format(vin)
      return vin if vin.match?(/[A-HJ-NPR-Z0-9]{17}/)
      raise StandardError.new("Invalid parameter")
    end
end