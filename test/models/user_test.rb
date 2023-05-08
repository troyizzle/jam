# frozen_string_literal: true
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'a user without a username will be assigned one' do
    user = users(:example)
    user.email = 'foo@bar.com'
    user.save!

    assert_equal 'foo', user.username
  end

  test 'a user with a username with be assigned it' do
    user = users(:example)
    user.username = 'foobar'
    user.save!

    assert_equal 'foobar', user.username
  end
end
