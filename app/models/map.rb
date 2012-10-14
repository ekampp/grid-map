class Map
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  field :size_x, type: Integer
  field :size_y, type: Integer

  embeds_many :tiles
end
