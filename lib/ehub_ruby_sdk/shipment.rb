# frozen_string_literal: true

module EhubRubySdk
  class Shipment
    class << self
      def create(data, client:, token:)
        shipment = client.post(path, data, {"Content-Type" => "application/json", "Authorization" => "Bearer #{token}"})

        build shipment.with_indifferent_access
        #  {"shipment"=>
        #  {"id"=>112742377,
        #   "external_id"=>"shp_141a335b04d243bbb70f81fad34013bf",
        #   "order_id"=>"12345678",
        #   "account_reference"=>"customer1",
        #   "batch_id"=>nil,
        #   "pickup_id"=>nil,
        #   "to_location"=>
        #    {"external_id"=>nil,
        #     "company"=>"Muley Freak",
        #     "first_name"=>"Muley Freak",
        #     "last_name"=>nil,
        #     "nick_name"=>nil,
        #     "address1"=>"1069 Stewart Dr. ST 8",
        #     "address2"=>nil,
        #     "address3"=>nil,
        #     "city"=>"Ogden",
        #     "state"=>"UT",
        #     "country"=>"US",
        #     "postal_code"=>"84404",
        #     "phone"=>"000-000-0000",
        #     "email"=>nil},
        #   "from_location"=>
        #    {"external_id"=>nil,
        #     "company"=>"Muley Freak",
        #     "first_name"=>"Muley Freak",
        #     "last_name"=>nil,
        #     "nick_name"=>nil,
        #     "address1"=>"1069 Stewart Dr. ST 8",
        #     "address2"=>nil,
        #     "address3"=>nil,
        #     "city"=>"Ogden",
        #     "state"=>"UT",
        #     "country"=>"US",
        #     "postal_code"=>"84404",
        #     "phone"=>"000-000-0000",
        #     "email"=>nil},
        #   "return_location"=>
        #    {"external_id"=>nil,
        #     "company"=>"Muley Freak",
        #     "first_name"=>"Muley Freak",
        #     "last_name"=>nil,
        #     "nick_name"=>nil,
        #     "address1"=>"1069 Stewart Dr. ST 8",
        #     "address2"=>nil,
        #     "address3"=>nil,
        #     "city"=>"Ogden",
        #     "state"=>"UT",
        #     "country"=>"US",
        #     "postal_code"=>"84404",
        #     "phone"=>"000-000-0000",
        #     "email"=>nil},
        #   "parcels"=>
        #    [{"id"=>133931924,
        #      "length"=>8.0,
        #      "width"=>8.0,
        #      "height"=>7.0,
        #      "weight"=>13.0,
        #      "package_type"=>"parcel",
        #      "created_at"=>"2023-08-14T23:18:05.000Z",
        #      "updated_at"=>"2023-08-14T23:18:05.000Z",
        #      "external_shipment_id"=>"shp_141a335b04d243bbb70f81fad34013bf",
        #      "tracking_number"=>"9400100105440254178108",
        #      "shipping_cost"=>5.85,
        #      "shipping_cost_details"=>[{"cost_type"=>"std", "description"=>nil, "rate"=>5.85}],
        #      "meter_cost"=>5.85,
        #      "meter_cost_details"=>[{"cost_type"=>"std", "description"=>nil, "rate"=>5.85}],
        #      "status"=>"shipped",
        #      "parcel_items"=>
        #       [{"id"=>23971323,
        #         "item_id"=>nil,
        #         "name"=>"Muley Freak Wrist Band",
        #         "accounting_number"=>nil,
        #         "variant_name"=>nil,
        #         "variant_id"=>nil,
        #         "variant_option1"=>nil,
        #         "variant_option2"=>nil,
        #         "variant_option3"=>nil,
        #         "image_src"=>nil,
        #         "external_id"=>nil,
        #         "sku"=>nil,
        #         "weight"=>1.0,
        #         "length"=>nil,
        #         "width"=>nil,
        #         "height"=>nil,
        #         "quantity"=>1.0,
        #         "price"=>1.0,
        #         "cost"=>6.7433,
        #         "country_of_origin"=>nil,
        #         "customs_data"=>{"content_type"=>"merchandise", "no_delivery"=>"return", "hs_tariff_code"=>nil, "value"=>"1.0", "eel_pfc"=>nil}}],
        #      "customs_data"=>{"content_type"=>"merchandise", "no_delivery"=>"return", "hs_tariff_code"=>nil, "value"=>"1.01", "eel_pfc"=>nil},
        #      "postage_label"=>
        #       {"id"=>112325425,
        #        "dims"=>"4x6",
        #        "resolution"=>300,
        #        "status"=>"active",
        #        "image_url"=>"https://ehub-prod.s3.amazonaws.com/public/files/label_images/20230814/31f6065d-b5ff-4b3d-862b-e213f7c07b43.pdf",
        #        "created_at"=>"2023-08-14T23:18:05.000Z",
        #        "updated_at"=>"2023-08-14T23:18:05.000Z",
        #        "base64_image"=>nil},
        #      "ship_date"=>"2023-08-14",
        #      "shipped_at"=>"2023-08-14T23:18:05.000Z",
        #      "description"=>nil,
        #      "service_options"=>nil,
        #      "tracking_info"=>{"status"=>"unknown", "updated_at"=>nil, "estimated_delivery_date"=>nil, "delivery_date"=>nil, "tracking_events"=>[]},
        #      "rate_calc_type"=>"standard"}],
        #   "status"=>"shipped",
        #   "shipping_service"=>
        #    {"service"=>"First Class Mail",
        #     "service_id"=>683,
        #     "service_code"=>"usps_first_class",
        #     "carrier_code"=>"usps",
        #     "rate"=>5.85,
        #     "meter_rate"=>5.85,
        #     "delivery_days"=>nil,
        #     "delivery_date"=>"2023-08-16T00:00:00.000Z",
        #     "delivery_guaranteed"=>false},
        #   "tracking_number"=>"9400100105440254178108",
        #   "shipped_at"=>"2023-08-14T23:18:05.000Z",
        #   "created_at"=>"2023-08-14T23:18:05.000Z",
        #   "updated_at"=>"2023-08-14T23:18:05.000Z",
        #   "label_text1"=>nil,
        #   "label_text2"=>nil,
        #   "price_group"=>"1"},
        # "payment"=>nil}
      end

      private

      def build(result)
        shipment = result[:shipment]
        payment = result[:payment]

        new(
          shipment,
          payment
        )
      end

      def path
        "api/v2/shipments/ship"
      end
    end

    def initialize(
      shipment,
      payment
    )
      @shipment = shipment
      @payment = payment
    end
    attr_reader :shipment, :payment

    def image_url
      response = HTTParty.get(shipment[:parcels][0][:postage_label][:image_url])
      response.body
    end
  end
end
