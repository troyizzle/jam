# frozen_string_literal: true
require 'test_helper'

module Users
  class OmniauthCallbacksControllerTest < ActionDispatch::IntegrationTest
    include OmniauthDiscordHelper

    test 'should successfully create a user with discord' do
      valid_discord_login_setup
      info = OmniAuth.config.mock_auth[:discord].info

      assert_difference 'User.count' do
        assert_difference 'Profile.count' do
          post user_discord_omniauth_callback_path
          profile = Profile.last
          user = profile.user
          assert_equal info['first_name'], profile.first_name
          assert_equal info['last_name'], profile.last_name
          assert_equal info['email'], user.email
          assert profile.avatar.attached?
        end
      end
    end
  end
end
