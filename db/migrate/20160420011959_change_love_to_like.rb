class ChangeLoveToLike < ActiveRecord::Migration
  def change
    rename_table :loves, :likes
  end
end
