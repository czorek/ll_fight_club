class CreateFights < ActiveRecord::Migration
  def change
    create_table :fights do |t|
      t.references :winner, index: true, foreign_key: true
      t.references :loser, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
