require "spec_helper"

RSpec.describe EhubRubySdk::Shipment do
  describe '.create' do
    before do
      EhubRubySdk.configure do |c|
        c.api_key = CONFIG[:api_key]
      end
    end
    it "returns a Shipment object", vcr: { record: :once, match_requests_on: %i[method] } do
      client = EhubRubySdk::Client.new(test: true)
      data = {
        "shipment": {
          "order_id": "12345678",
          "account_reference": "customer1",
          "to_location": {
            "company": "Muley Freak",
            "first_name": "Muley Freak",
            "address1": "1069 Stewart Dr. ST 8",
            "city": "Ogden",
            "state": "UT",
            "country": "US",
            "postal_code": "84404", "phone": "000-000-0000"
          },
          "from_location": {
            "company": "Muley Freak",
            "first_name": "Muley Freak",
            "address1": "1069 Stewart Dr. ST 8",
            "city": "Ogden",
            "state": "UT",
            "country": "US",
            "postal_code": "84404",
            "phone": "000-000-0000"
          },
          "parcels": [
            {
              "length": 8.0,
              "width": 8.0,
              "height": 7.0,
              "weight": 13.0,
              "package_type": "parcel",
              "parcel_items": [
                {
                  "id": 1877,
                  "item_id": "823",
                  "name": "Muley Freak Wrist Band",
                  "weight": 1.0,
                  "quantity": 1.0,
                  "price": 1.0,
                  "cost": 6.743333333333333,
                  "customs_data": {
                    "content_type": "merchandise",
                    "no_delivery": "return",
                    "value": 1.0
                  }
                }
              ],
              "customs_data": {
                "content_type": "merchandise",
                "no_delivery": "return",
                "value": 1.01
              }
            }
          ],
          "service_id": 683,
          "label_size": "4x6",
          "label_format": "pdf"
        }
      }

      shipment = described_class.create(data, client: client, token: EhubRubySdk.configuration.api_key)
      expect(shipment).to be_a(EhubRubySdk::Shipment)
    end
  end
end
