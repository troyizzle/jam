# frozen_string_literal: true
class CreateBets < ActiveRecord::Migration[7.0]
  def change
    create_table :bets do |t|
      t.integer :status, default: 0, null: false
      t.integer :stake, defualt: 0
      t.integer :result, default: 0
      t.datetime :date_placed, null: true
      t.datetime :date_settled, null: true
      t.string :prize_pick_id, null: false, index: true
      t.jsonb :data

      t.timestamps
    end
  end
end
