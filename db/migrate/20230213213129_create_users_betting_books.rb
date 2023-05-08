# frozen_string_literal: true
class CreateUsersBettingBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :users_betting_books do |t|
      t.references :user, null: false, foreign_key: true
      t.references :betting_book, null: false, foreign_key: true
      t.string :email
      t.string :password, null: true, default: ''
      t.integer :deposited_amount, default: 0, null: false
      t.integer :status, default: 0, null: false
      t.datetime :last_synced_at, null: true
      t.timestamps

      t.index %i[user_id betting_book_id], unique: true
    end
  end
end
