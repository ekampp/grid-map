class Map
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  field :size, type: Integer

  embeds_many :tiles

  # Returns the default grid size. This is the wise of a single side of a
  # square map.
  #
  def self.default_grid_size
    20
  end

  # Builds the tiles to match a grid of the given `size`
  #
  def build_grid size
    self.tiles.clear
    size.to_i.times do |row|
      size.to_i.times do |column|
        self.tiles.build({
          x: column,
          y: row
        })
      end
    end
  end
end
