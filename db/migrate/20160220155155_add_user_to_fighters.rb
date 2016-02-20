class AddUserToFighters < ActiveRecord::Migration
  def change
    add_reference :fighters, :user, index: true, foreign_key: true
  end
end
