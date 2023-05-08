# frozen_string_literal: true
module OmniauthDiscordHelper
  def valid_discord_login_setup
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:discord] = OmniAuth::AuthHash.new(faker_omniauth_discord)
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:discord]
  end

  private

  # Faker::Omniauth does not have an auth for disord, so we need to create one
  # google is the closest to discord
  def faker_omniauth_discord
    auth = Faker::Omniauth.google
    auth[:provider] = 'discord'

    auth
  end
end
