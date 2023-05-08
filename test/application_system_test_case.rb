# frozen_string_literal: true
require 'test_helper'
require 'webdrivers'

WINDOWS_HOST = `cat /etc/resolv.conf | grep nameserver | awk '{ print $2 }'`.strip
CHROMEDRIVER_URL = "http://#{WINDOWS_HOST}:9515/".freeze

Capybara.register_driver :headless_chrome do |app|
  options = ::Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--headless') unless ActiveModel::Type::Boolean.new.cast(ENV['HEADFUL'])
  options.add_argument('--window-size=1920,1080')

  client = Selenium::WebDriver::Remote::Http::Default.new
  client.read_timeout = 240

  Capybara::Selenium::Driver.new(app, browser: :chrome, capabilities: [options], http_client: client,
                                      url: CHROMEDRIVER_URL)
end

Capybara.javascript_driver = :headless_chrome

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include Devise::Test::IntegrationHelpers
  include OmniauthDiscordHelper

  driven_by :headless_chrome
end
