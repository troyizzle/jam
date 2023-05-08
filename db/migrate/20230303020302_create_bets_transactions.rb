class CreateBetsTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :bets_transactions do |t|
      t.references :bet, null: true, foreign_key: true
      t.integer :prize_pick_id, null: false, index: true
      t.jsonb :data
      t.timestamps
    end
  end
end
