# frozen_string_literal: true
require 'application_system_test_case'

class LoginTest < ApplicationSystemTestCase
  test 'users can log in' do
    user = users(:one)
    visit new_user_session_path
    assert_text 'Login to your account'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password'
    click_button 'Login'

    assert_text 'Signed in successfully.'
  end

  class LoginWithDiscordOauthTest < ApplicationSystemTestCase
    include OmniauthDiscordHelper

    test 'login with discord oauth' do
      valid_discord_login_setup
      visit new_user_session_path
      click_button 'Discord'

      assert_text 'Successfully authenticated from Discord account'
    end
  end
end
