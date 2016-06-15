class Genre < ActiveRecord::Base
  has_many :tracks
end
