class UserTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :first_name, null:false
      t.string  :last_name, null: false
      t.string  :username, null: false
      t.string  :password, null: false
    end
  end
end
