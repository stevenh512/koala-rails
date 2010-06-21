require "koala-rails/helpers"

ActiveSupport.on_load(:action_controller) do
  include KoalaRails::Helpers
end

