require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  test 'can not access profile without being signed in' do
    get edit_profile_path
    assert_redirected_to new_user_session_path
  end

  test 'date of birth in future returns error' do
    user = users(:one)
    sign_in user

    patch profile_path(format: :turbo_stream), params: {
      profile: {
        date_of_birth: Date.today + 1.day
      }
    }

    assert_match(/Date of birth can not be in future/, response.body)
  end
end
