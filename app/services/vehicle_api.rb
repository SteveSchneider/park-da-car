class VehicleApi
    class VehicleApiError < StandardError; end
    require 'net/http'
    require 'json'

    API_BASE_URL = "https://vpic.nhtsa.dot.gov/api/vehicles/".freeze

    def self.decode_vin(vin)
        endpoint = "DecodeVinValues/"
        valid_vin = VinHelper.check_format(vin)
        uri = URI(API_BASE_URL).merge(endpoint).merge(valid_vin)
        uri.query = ("format=json")
        response = Net::HTTP.get(uri)
        body = JSON.parse(response)
        Rails.logger.info("API responded at <#{uri.to_s}>: #{response}")
        (body["Message"].include? "Results returned successfully") ? body["Results"].first : (raise StandardError.new(body["Message"]))
    rescue StandardError => e
        Rails.logger.error(e)
        raise VehicleApiError.new("Failed decoding VIN #{vin}: #{e}")
    end

    def self.decode_vin_batch(vin_array)
        raise StandardError.new("Invalid input type") unless vin_array.is_a? Array
        endpoint = "DecodeVINValuesBatch"
        uri = URI(API_BASE_URL).merge(endpoint)
        #valid_vins = []
        #valid_vins << vin_array.map{ |v| VinHelper.check_format(v) }
        #vins_string = valid_vins
        response = Net::HTTP.post_form(uri, {"format"=>"json", "data"=> vin_array.join(";")})
        body = JSON.parse(response.body)["Results"] if response.is_a? Net::HTTPOK
        err = body.map{ |b| "#{b["VIN"]}:#{b["ErrorText"]}" if b["ErrorCode"].present? }
        raise StandardError.new(err.to_s) unless err.empty?
        body
    rescue StandardError => e
        Rails.logger.error(e)
        raise VehicleApiError.new("Failed decoding VIN(s): #{e}")
    end

end