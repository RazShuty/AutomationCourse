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

  def get_element(definition, element)
    results = @driver.find_elements(definition, element)
    if results.length==0
      return nil
    else
      return results
    end
  end

  def get_title
    @driver.title
  end

  def maximize
    @driver.manage.window.maximize
  end


  def close
    @driver.close
  end
end