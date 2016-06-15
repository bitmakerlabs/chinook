class Track < ActiveRecord::Base
  belongs_to :album
  belongs_to :genre
  belongs_to :media_type
  has_and_belongs_to_many :playlists
end
