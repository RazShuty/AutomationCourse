require 'selenium-webdriver'

class Browser

  attr_accessor :driver

  def setup(browser_type)
    @driver = Selenium::WebDriver.for(browser_type)
    @driver
  end

  def navigate_to_page(url)
    @driver.get(url)
  end

  def close
    @driver.close
  end
end