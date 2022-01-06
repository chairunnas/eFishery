require "capybara/cucumber"
require "capybara-screenshot/cucumber"
require "capybara/rspec"
require "selenium-webdriver"
require 'rspec'
require "rspec/retry"
require "headless"
require 'webdrivers/chromedriver'
require 'webdrivers/geckodriver'
require 'webdrivers/iedriver'
require 'webdrivers/edgedriver'
require 'faker'
require 'report_builder'
require 'site_prism'
require "dotenv"
Dotenv.load

private def browser_driver(browser, width, height, prune, wait_time, timeout, host, append_timestamp, headless = "false")
  case browser.upcase
  when "CHROME"
    if headless.eql? "true"
      driver = :selenium_chrome_headless
    else
      driver = :selenium_chrome
    end
  when "FIREFOX"
    if headless.eql? "true"
      driver = :selenium_headless
    else
      driver = :selenium
    end
  else
    raise "Browser #{browser} tidak ditemukan"
  end
  Capybara.default_driver = driver
  puts "Host       : #{host}"
  puts "User-Agent : #{browser}"
  Capybara.app_host = host
  Capybara.default_max_wait_time = wait_time
  page.driver.browser.manage.window.resize_to(width, height)
  visit("#{host}")
end

def browser_specification(width = 1366, height = 768, prune = 50, user_agent = "", wait_time = 3, timeout = 120, host = "", append_timestamp = true)
  browser_driver(user_agent,width,height,prune,wait_time,timeout,host,append_timestamp,ENV['BROWSER_HEADLESS'])
end

Before do
  user_agent = ENV['DESKTOP_USER_AGENT'] || 'chrome'
  browser_specification(1366, 768, 50, user_agent, 45, 480, ENV['BASE_URL'])
end
