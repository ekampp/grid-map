class MapsController < InheritedResources::Base

  def new
    @map = build_resource
    @map.build_grid(Map.default_grid_size)
    super
  end

end
