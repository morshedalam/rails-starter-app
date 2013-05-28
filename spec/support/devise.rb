#Test helpers to make default user and logs in before each test run
RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
end
