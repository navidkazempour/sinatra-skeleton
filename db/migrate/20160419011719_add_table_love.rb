class AddTableLove < ActiveRecord::Migration
  def change
    create_table :loves do |t|
      t.references :user
      t.references :track
      t.timestamps
    end
  end
end
