class AddLevelToFighters < ActiveRecord::Migration
  def change
    add_column :fighters, :level, :integer, default: 1
  end
end
