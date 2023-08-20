# frozen_string_literal: true

require "gem_config"
require "ehub_ruby_sdk/version"
require "ehub_ruby_sdk/client"
require "ehub_ruby_sdk/rate"
require "ehub_ruby_sdk/shipment"

module EhubRubySdk
  include GemConfig::Base

  with_configuration do
    has :api_key, classes: String
  end
end
