# frozen_string_literal: true

require 'capybara/rspec'
require 'selenium-webdriver'
require 'webdrivers'

Capybara.configure do |config|
  config.default_driver = :selenium
  config.javascript_driver = :selenium
  config.default_max_wait_time = 10
end

Capybara.register_driver :selenium do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--headless')
  options.add_argument('--disable-gpu')
  options.add_argument('--no-sandbox')
  options.add_argument('--disable-dev-shm-usage')

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options).tap do |driver|
    driver.browser.manage.window.size = Selenium::WebDriver::Dimension.new(1280, 1024)
  end
end
