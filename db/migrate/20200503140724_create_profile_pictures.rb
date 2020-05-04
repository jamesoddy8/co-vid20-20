class CreateProfilePictures < ActiveRecord::Migration[6.0]
  def change
    create_table :profile_pictures do |t|
      t.text :caption
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
