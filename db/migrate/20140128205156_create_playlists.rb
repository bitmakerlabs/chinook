class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :name

      t.timestamps
    end

    create_table :playlists_tracks do |t|
      t.belongs_to :playlist
      t.belongs_to :track
    end
  end
end
