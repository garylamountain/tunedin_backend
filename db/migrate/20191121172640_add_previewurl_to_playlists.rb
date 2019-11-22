class AddPreviewurlToPlaylists < ActiveRecord::Migration[5.1]
  def change
    add_column :playlists, :preview_url, :string
  end
end
