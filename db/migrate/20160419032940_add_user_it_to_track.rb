class AddUserItToTrack < ActiveRecord::Migration
  def change
    add_reference :tracks, :user
  end
end
