class RazStuff

  driver = Selenium::WebDriver.for(:firefox)
  driver.get("http://amazon.de")
  driver.manage.window.maximize
  driver.find_element(:id, "nav-your-amazon").click
  driver.find_element(:id, "ap_email").clear
  driver.find_element(:id, "ap_email").send_keys "monkey@ohhh.com"
  driver.find_element(:id, "ap_password").clear
  driver.find_element(:id, "ap_password").send_keys "monkeyisugly"
  driver.find_element(:id, "signInSubmit-input").click

  message= driver.find_elements(:css, "p")

  assert_equal("Bei der Eingabe Ihrer E-Mail-Adresse/Ihres Kennworts ist ein Fehler aufgetreten. Versuchen Sie es erneut.", message)





  driver = Selenium::WebDriver.for(:firefox)

  expected_invalid_login_error_message = "Bei der Eingabe Ihrer E-Mail-Adresse/Ihres Kennworts ist ein Fehler aufgetreten. Versuchen Sie es erneut."
  amazon_login_page = AmazonLoginPage.new(driver)
  amazon_login_page.navigate_to_page
  amazon_login_page.set_username_in_username_field("monkey@ohhh.com")
  amazon_login_page.set_password_in_password_field("monkeyisugly")
  amazon_login_page.perform_login_expect_failure

  actual_login_error_message = amazon_login_page.get_invalid_login_error_message

  assert_equal(expected_invalid_login_error_message, actual_login_error_message)
  driver.get("http://amazon.de")
  driver.manage.window.maximize
  driver.find_element(:id, "nav-your-amazon").click
  driver.find_element(:id, "ap_email").clear
  driver.find_element(:id, "ap_email").send_keys
  driver.find_element(:id, "ap_password").clear
  driver.find_element(:id, "ap_password").send_keys "monkeyisugly"
  driver.find_element(:id, "signInSubmit-input").click

  message= driver.find_elements(:css, "p")

  assert_equal("Bei der Eingabe Ihrer E-Mail-Adresse/Ihres Kennworts ist ein Fehler aufgetreten. Versuchen Sie es erneut.", message)





end