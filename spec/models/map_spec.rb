require 'spec_helper'

describe Map do
  # Fields
  it { should have_fields(:name, :description, :size) }

  # Relations
  it { should embed_many :tiles }

  # Class methods
  describe "Map.default_grid_size" do
    it { Map.should respond_to :default_grid_size }
    it { Map.default_grid_size.should be_a Integer }
  end
end
