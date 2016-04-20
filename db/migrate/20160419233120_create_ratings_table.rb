class CreateRatingsTable < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :track
      t.integer :rate, default: 0
      t.references :user
    end 
  end
end
