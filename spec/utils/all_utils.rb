require_relative './login'
require_relative './user_authorization'

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Warden::Test::Helpers
  config.extend Login, type: :controller
  config.extend User_authorization
end