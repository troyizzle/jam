# frozen_string_literal: true
require 'application_system_test_case'

class BetsTest < ApplicationSystemTestCase
  setup do
    @bet = bets(:one)
  end

  test 'visiting the index' do
    visit bets_url
    assert_selector 'h1', text: 'Bets'
  end

  test 'should create bet' do
    visit bets_url
    click_on 'New bet'

    fill_in 'Book', with: @bet.book
    fill_in 'Odds', with: @bet.odds
    fill_in 'Status', with: @bet.status
    fill_in 'Tailed', with: @bet.tailed
    fill_in 'User', with: @bet.user_id
    click_on 'Create Bet'

    assert_text 'Bet was successfully created'
    click_on 'Back'
  end

  test 'should update Bet' do
    visit bet_url(@bet)
    click_on 'Edit this bet', match: :first

    fill_in 'Book', with: @bet.book
    fill_in 'Odds', with: @bet.odds
    fill_in 'Status', with: @bet.status
    fill_in 'Tailed', with: @bet.tailed
    fill_in 'User', with: @bet.user_id
    click_on 'Update Bet'

    assert_text 'Bet was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Bet' do
    visit bet_url(@bet)
    click_on 'Destroy this bet', match: :first

    assert_text 'Bet was successfully destroyed'
  end
end
