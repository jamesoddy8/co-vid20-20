class Addprofilestovideos < ActiveRecord::Migration[6.0]
  def change
    add_column :videos, :profiles_id, :int8
  end
end
