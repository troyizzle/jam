# frozen_string_literal: true
class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :first_name, default: ''
      t.string :last_name, default: ''
      t.text :bio, default: ''
      t.date :date_of_birth
      t.string :github, default: ''
      t.string :twitter, default: ''

      t.timestamps
    end
  end
end
