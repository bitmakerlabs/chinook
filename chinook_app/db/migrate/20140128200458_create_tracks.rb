class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.references  :album
      t.references  :genre
      t.references  :media_type
      t.string      :name,          null: false
      t.string      :composer
      t.integer     :milliseconds,  null: false
      t.integer     :bytes
      t.decimal     :unit_price,    precision: 10, scale: 2

      t.timestamps
    end
  end
end
