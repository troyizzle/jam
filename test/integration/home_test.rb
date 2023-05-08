# frozen_string_literal: true
require 'test_helper'

class HomeTest < ActionDispatch::IntegrationTest
  test 'home page renders sucessfully' do
    get root_path
  end
end
