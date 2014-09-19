
require 'selenium-webdriver'

class MonitoringTest

  tooltips = Array.new

  driver = Selenium::WebDriver.for(:firefox)
  driver.get('https://dashboard.fyber.com')
  wait = Selenium::WebDriver::Wait.new(:timeout => 25)
  driver.manage.window.maximize


  driver.find_element(:id, "user_session_login").clear
  driver.find_element(:id, "user_session_login").send_keys "PRODUCTION_MONITORING_USERNAME_HERE!!!!!"
  driver.find_element(:id, "user_session_password").clear
  driver.find_element(:id, "user_session_password").send_keys "PRODUCTION_MONITORING_PASSWORD_HERE!!!!"
  driver.find_element(:name, "commit").click

  driver.find_element(:link, "Analytics").click

  wait.until {driver.find_element(:xpath, "//*[contains(@class,'nv-point nv-point-')]")}


  charts = driver.find_elements(:xpath, "//*[contains(@class,'nv-point nv-point-')]")
  charts.each do |chart|
    chart.click
        driver.find_elements(:xpath, "//*[contains(@class,'nvtooltip nvtooltip-w')]").each do |tip|
          tooltips << tip.text
      end
  end

  tooltips.uniq.sort.each do |tooltip|
    puts tooltip
  end
end

