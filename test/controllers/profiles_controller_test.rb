# frozen_string_literal: true
require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  test 'date of birth in future returns error' do
    user = users(:example)
    sign_in user

    patch profile_path(user.profile, format: :turbo_stream), params: {
      profile: {
        date_of_birth: Date.today + 1.day,
      },
    }

    assert_match(/Date of birth can not be in future/, response.body)
  end

  test 'successful profile update' do
    user = users(:example)
    sign_in user
    profile = user.profile
    patch profile_path(profile, format: :turbo_stream), params: valid_profile_params

    valid_profile_params[:profile].each do |key, value|
      assert_equal value, profile.reload.send(key)
    end
  end

  def valid_profile_params
    {
      profile: {
        date_of_birth: Date.today - 1.day,
        first_name: 'John',
        last_name: 'Smith',
        github: 'foobar',
        twitter: 'foobaz',
        bio: 'Super long bio',
      },
    }
  end
end
