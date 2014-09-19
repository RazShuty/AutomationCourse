require 'selenium-webdriver'
require_relative '../helpers/browser'

class HomePageOfAmazon

  def setup
    browser = Browser.new
    browser.setup(:firefox)
    browser.navigate_to_page("http://amazon.de")

    #Todo: Tell Iva to add this functionality
    driver.manage.window.maximize
    browser
  end
  def verify_page_title
    browser = setup

    #Todo: Tell Iva to add this functionality
    page_title = driver.title #browser.get_title

    #Todo: Wait for Iva to create Assert class
    Assert.equals(page_title,"Amazon.de: Günstige Preise für Elektronik & Foto, Filme, Musik, Bücher, Games, Spielzeug & mehr","")
  end

  def verify_bucher_exists
    browser = setup
    #Todo: IVA!!!!!!
    Assert.equals(driver.find_element(:id, "nav_cat_7").text, "Bücher" , "")
  end

  def verify_headline
    browser = setup
    #Todo: IVA!!!
    driver.find_element(:link, "Hilfe").click
    Assert.equals(driver.find_element(:css, "h1").text, "Hilfe & Kundenservice", "Wrong headline")

  end
end