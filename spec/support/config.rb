config = YAML.load_file(SPEC_DIR.join('config.yml')).with_indifferent_access
if client_id = ENV['EHUB_API_KEY'].presence
  config[:api_key] = client_id
end
CONFIG = config
