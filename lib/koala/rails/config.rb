module Koala
  module Rails
    module Config
      CONFIG = YAML.load(ERB.new(File.read("#{Rails.root}/config/facebook.yml")).result)[Rails.env]
      APP_ID = CONFIG['app_id']
      SECRET = CONFIG['secret']
      SCOPES = CONFIG['scopes']
    end
  end
end