# frozen_string_literal: true
class AddUsersBettingBookReferenceToBets < ActiveRecord::Migration[7.0]
  def change
    add_reference :bets, :users_betting_book, null: true, foreign_key: true
  end
end
