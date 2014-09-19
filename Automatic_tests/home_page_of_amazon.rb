require 'selenium-webdriver'
require_relative '../helpers/browser'

class HomePageOfAmazon

  def setup
    browser = Browser.new
    browser.setup(:firefox)
    browser.navigate_to_page("http://amazon.de")

    browser.maximize
    browser
  end
  def verify_page_title
    browser = setup
    page_title = browser.get_title
    Assert.equals(page_title,"Amazon.de: Günstige Preise für Elektronik & Foto, Filme, Musik, Bücher, Games, Spielzeug & mehr","")
  end

  def verify_bucher_exists
    browser = setup
    Assert.equals(browser.get_element(:id, "nav_cat_7").text, "Bücher" , "")
  end

  def verify_headline
    browser = setup
    browser.get_element(:link, "Hilfe").click
    Assert.equals(browser.get_element(:css, "h1").text, "Hilfe & Kundenservice", "Wrong headline")

  end
end