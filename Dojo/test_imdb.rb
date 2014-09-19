require 'selenium-webdriver'

class NewElements

  driver = Selenium::WebDriver.for(:firefox)

  driver.get("http://amazon.de")

  driver.manage.window.maximize

  page_title = driver.title


  driver.find_element(:link, "Hilfe").click
  headline_title = driver.find_element(:css, "h1").text
  if headline_title == "Hilfe & Kundenservice"
    puts "OK headline title"
  else
    puts "Keine"

  end


  if page_title == "Amazon.de: Günstige Preise für Elektronik & Foto, Filme, Musik, Bücher, Games, Spielzeug & mehr"
    puts "OK"
  else
    puts "Keine"
  end
  if driver.find_elements(:id, "nav_cat_7").length == 1
      puts "OK"

      if (driver.find_element(:id, "nav_cat_7").text == "Bücher")
        puts "OK"
      else
        puts "Keine"
      end
  else
    puts "Keine"
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

  driver.find_element(:id, "nav-your-amazon").click
  driver.find_element(:id, "ap_email").clear
  driver.find_element(:id, "ap_email").send_keys "monkey@ohhh.com"
  driver.find_element(:id, "ap_password").clear
  driver.find_element(:id, "ap_password").send_keys "monkeyisugly"
  driver.find_element(:id, "signInSubmit-input").click

   message= driver.find_elements(:css, "p")
   if  message.length == 1
     puts "OK  1"
     if message.first.text == "Bei der Eingabe Ihrer E-Mail-Adresse/Ihres Kennworts ist ein Fehler aufgetreten. Versuchen Sie es erneut."
       puts "message OK"
     else
       puts "message not OK"
     end
   else
     puts "more than 1 or 0"
   end



  driver.close
end