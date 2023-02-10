module OmniauthDiscordHelper
  def valid_discord_login_setup
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:discord] = OmniAuth::AuthHash.new(Faker::Omniauth.google)
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:discord]
  end
end

