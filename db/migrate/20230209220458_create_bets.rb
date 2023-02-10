class CreateBets < ActiveRecord::Migration[7.0]
  def change
    create_table :bets do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :status
      t.integer :odds
      t.string :book
      t.string :tailed

      t.timestamps
    end
  end
end
