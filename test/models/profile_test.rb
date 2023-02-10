# frozen_string_literal: true
require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  def setup
    @profile = profiles(:one)
  end

  test 'empty first_name is valid' do
    @profile.first_name = ''
    @profile.save

    assert @profile.valid?
  end

  test 'first_name with numbers is not valid' do
    @profile.first_name = '123foo!'
    @profile.save

    assert_not @profile.valid?
  end

  test 'empty last_name is valid' do
    @profile.last_name = ''
    @profile.save

    assert @profile.valid?
  end

  test 'last_name with numbers is not valid' do
    @profile.last_name = '123foo!'
    @profile.save

    assert_not @profile.valid?
  end

  test 'empty date of birth is valid' do
    @profile.date_of_birth = ''
    @profile.save

    assert @profile.valid?
  end

  test 'date of birth in future is not valid' do
    @profile.date_of_birth = Date.current + 5.days
    @profile.save

    assert_not @profile.valid?
  end
end
