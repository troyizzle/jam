# frozen_string_literal: true
class CreateBettingBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :betting_books do |t|
      t.string :name, default: '', null: false
      t.boolean :enabled, default: false, null: false
      t.timestamps
    end
  end
end
