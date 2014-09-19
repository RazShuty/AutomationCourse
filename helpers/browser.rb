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

  def get_element(element)
    results = @driver.find_elements(element)
    if results.length==0
      return nill
    else
      return results
    end
  end

  def close
    @driver.close
  end
end