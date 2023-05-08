# frozen_string_literal: true
require 'test_helper'

module Users
  class RegistrationsControllerTest < ActionDispatch::IntegrationTest
    test 'should be able to register a user' do
      assert_difference 'User.count' do
        assert_difference 'Profile.count' do
          post user_registration_path, params: {
            user: {
              email: 'test@test.com',
              password: 'Password123!',
              confirm_password: 'Password123!',
            },
          }

          assert_redirected_to settings_path
        end
      end
    end
  end
end
