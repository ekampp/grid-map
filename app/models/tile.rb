class Tile
  include Mongoid::Document

  field :description, type: String
  field :x, type: Integer
  field :y, type: Integer

  embedded_in :map
end
