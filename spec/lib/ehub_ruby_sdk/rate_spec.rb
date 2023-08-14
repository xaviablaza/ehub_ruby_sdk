require "spec_helper"

RSpec.describe EhubRubySdk::Rate do
  describe '.create' do
    before do
      EhubRubySdk.configure do |c|
        c.api_key = CONFIG[:api_key]
      end
    end
    it "returns a Rate object", vcr: { record: :once, match_requests_on: %i[method] } do
      client = EhubRubySdk::Client.new(test: true)
      data = {
        "shipment": {
          "to_location": {
            "company": "",
            "first_name": "Kevin",
            "last_name": "Shaw",
            "nick_name": "Kev",
            "address1": "1025 SANSOME ST",
            "address2": "",
            "address3": "",
            "city": "SAN FRANCISCO",
            "state": "CA",
            "country": "US",
            "postal_code": "94111",
            "phone": "4156565367",
            "email": "kevin.shaw@gmail.com"
          },
          "from_location": {
            "company": "Touch of Modern LLC",
            "first_name": "Shipping",
            "last_name": "Team",
            "nick_name": "",
            "address1": "901 E NORTHFIELD DR",
            "address2": "",
            "address3": "",
            "city": "BROWNSBURG",
            "state": "IN",
            "country": "US",
            "postal_code": "46112",
            "phone": "4152300750",
            "email": "support@touchofmodern.com"
          },
          "parcels": [
            {
              "length": 5,
              "width": 5,
              "height": 5,
              "weight": 16,
              "package_type": "parcel",
            }
          ]
        },
        "show_all_services": true
      }
      rate = described_class.create(data, client: client, token: EhubRubySdk.configuration.api_key)
      expect(rate).to be_a(EhubRubySdk::Rate)
    end
  end
end
