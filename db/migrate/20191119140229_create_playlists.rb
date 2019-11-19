class CreatePlaylists < ActiveRecord::Migration[5.1]
  def change
    create_table :playlists do |t|
      t.string :name
      t.string :url
      t.string :relatedPlaylists, array: true, default: []

      t.timestamps
    end
  end
end
