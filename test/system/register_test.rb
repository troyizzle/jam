# frozen_string_literal: true
require 'application_system_test_case'

class RegisterTest < ApplicationSystemTestCase
  test 'users can register in' do
    visit new_user_registration_path

    assert_text 'Create your account'

    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'Password123!'
    fill_in 'Password confirmation', with: 'Password123!'

    click_button 'Register'

    assert_text  'Settings page'
  end
end
