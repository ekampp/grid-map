require 'spec_helper'

describe Tile do
  # Fields
  it { should have_fields(:description, :x, :y) }

  # Relations
  it { should be_embedded_in :map }
end
