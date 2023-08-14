# frozen_string_literal: true

module EhubRubySdk
  class Rate
    class << self
      def create(data, client:, token:)
        rate = client.post(path, data, {"Content-Type" => "application/json", "Authorization" => "Bearer #{token}"})

        build rate.with_indifferent_access
        #        {"service_rates"=>
        #  [{"service"=>"Priority Mail Express",
        #    "service_id"=>685,
        #    "service_code"=>"usps_express",
        #    "carrier_code"=>"usps",
        #    "rate"=>44.6,
        #    "rate_details"=>[{"cost_type"=>"std", "description"=>nil, "rate"=>44.6}],
        #    "meter_rate"=>44.6,
        #    "meter_rate_details"=>[{"cost_type"=>"std", "description"=>nil, "rate"=>44.6}],
        #    "retail_rate"=>51.65,
        #    "std_rates"=>nil,
        #    "errors"=>nil,
        #    "delivery_days"=>2,
        #    "min_delivery_days"=>nil,
        #    "max_delivery_days"=>nil,
        #    "delivery_date"=>"2023-08-16",
        #    "delivery_guaranteed"=>false,
        #    "rate_calc_type"=>["standard"],
        #    "price_group"=>"8"},
        #   {"service"=>"Priority Mail",
        #    "service_id"=>684,
        #    "service_code"=>"usps_priority",
        #    "carrier_code"=>"usps",
        #    "rate"=>10.07,
        #    "rate_details"=>[{"cost_type"=>"std", "description"=>nil, "rate"=>10.07}],
        #    "meter_rate"=>10.07,
        #    "meter_rate_details"=>[{"cost_type"=>"std", "description"=>nil, "rate"=>10.07}],
        #    "retail_rate"=>12.55,
        #    "std_rates"=>nil,
        #    "errors"=>nil,
        #    "delivery_days"=>2,
        #    "min_delivery_days"=>nil,
        #    "max_delivery_days"=>nil,
        #    "delivery_date"=>"2023-08-16",
        #    "delivery_guaranteed"=>false,
        #    "rate_calc_type"=>["standard"],
        #    "price_group"=>"8"}],
        # "warnings"=>[]}
      end

      private

      def build(result)
        service_rates = result[:service_rates]
        warnings = result[:warnings]

        new(
          service_rates,
          warnings
        )
      end

      def path
        "api/v2/rates"
      end
    end

    def initialize(
      service_rates,
      warnings
    )
      @service_rates = service_rates
      @warnings = warnings
    end
    attr_reader :service_rates, \
      :warnings
  end
end
