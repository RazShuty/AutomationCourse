require 'selenium-webdriver'

class Runner

  driver = Selenium::WebDriver.for(:firefox)

  driver.get('https://staging.dashboard.sponsorpay.com/login?company_id=1&locale=en')

  def test_login_with_invalid_params_expect_login_error_message username, password, error_message
    username_input = driver.find_element(:id, 'user_session_login')
    username_input.clear
    username_input.send_keys username

    password_input = driver.find_element(:id, 'user_session_password')
    password_input.clear
    password_input.send_keys password
    driver.find_element(:name, 'commit').click

    verify { assert_equal error_message, driver.find_element(:css, "span.help-inline").text }

  end


end