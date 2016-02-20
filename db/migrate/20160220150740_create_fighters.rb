class CreateFighters < ActiveRecord::Migration
  def change
    create_table :fighters do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.text :description
      t.integer :experience, null: false, default: 0
      t.string :avatar

      t.timestamps null: false
    end
  end
end
