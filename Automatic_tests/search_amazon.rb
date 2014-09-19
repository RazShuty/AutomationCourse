
require_relative '../helpers/browser'

class SearchAmazon

  def setup
    browser = Browser.new
    browser.setup(:firefox)
    browser.navigate_to_page('http://amazon.de')
    browser
  end
  def verify_price_for_existing_item()

  end
  def verify_keyword_exists_in_title

  end


  driver.find_element(:id, "twotabsearchtextbox").clear
  driver.find_element(:id, "twotabsearchtextbox").send_keys "bett"
  driver.find_element(:css, "input.nav-submit-input").click

  first_bett_price = driver.find_elements(:xpath, "//div[@id='result_0']/ul/li/div/a/span[1]")
  if first_bett_price.length == 1
    puts "we have 1"
    if first_bett_price.first.text == "EUR 139,00"
      puts "Its the good one"
    else
      puts "Its the bad bett"
    end
  else
    puts "don't have one"
  end
end