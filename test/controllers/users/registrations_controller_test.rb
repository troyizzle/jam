require 'test_helper'

class User::RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test 'should be able to register a user' do
    assert_difference 'User.count' do
      assert_difference 'Profile.count' do
        post user_registration_path, params: { user: {
          email: 'test@test.com',
          password: 'Password123!',
          confirm_password: 'Password123!'
        } }

        assert_redirected_to edit_user_registration_path
      end
    end
  end

  test 'can access edit path when signed in' do
    sign_in users(:one)
    get edit_user_registration_path
    assert_response :success
    assert_match(/Edit Hero/, response.body)
  end

  test 'able to update profile attributes' do
    user = users(:one)
    sign_in user
    profile_params = { profile_attribues: { first_name: 'dude' } }
    patch user_registration_path, params: { user: profile_params }
    user.profile.reload

    assert_equal 'dude', user.profile.first_name
  end
end
