require "koala-rails/helpers"
require "koala-rails/initializer"

ActiveSupport.on_load(:action_controller) do
  include KoalaRails::Helpers
end

