class Tile
  include Mongoid::Document

  field :description, type: String

  embedded_in :map
end
