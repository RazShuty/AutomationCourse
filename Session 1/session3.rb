require 'selenium-webdriver'

class Session3

  driver = Selenium::WebDriver.for(:firefox)

  driver.get('https://www.google.de/')
  driver.find_element(:id, "gbqfq").clear
  driver.find_element(:id, "gbqfq").send_keys "Raz shuty"
  driver.find_element(:id, "gbqfb").click




end