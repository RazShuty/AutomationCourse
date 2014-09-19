require 'selenium-webdriver'

class NewElements

  driver = Selenium::WebDriver.for(:firefox)
  driver.get('file:///Users/raz/RubymineProjects/AutomationCourse/RadioButton.html')

  driver.find_element(:xpath, '//tr[2]/td').text
end