require 'capybara/rspec'
require 'webdrivers'

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.default_driver = :chrome
Capybara.server = :puma, { Silent: true }
