require "application_system_test_case"

class RegisterTest < ApplicationSystemTestCase
  test "users can register in" do
    # Check that this path isn't available to signed in users.
    # That clicked on the button will render errors
    # Clicking on register should bring the user to a form to fill out
    # more information
    visit new_user_registration_path

    assert_text "Create your account"

    fill_in "Email", with: "test@test.com"
    fill_in "Password", with: "Password123!"
    fill_in "Password confirmation", with: "Password123!"

    click_button "Register"

    assert_text  "New profile"
  end
end
