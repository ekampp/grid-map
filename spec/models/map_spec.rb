require 'spec_helper'

describe Map do
  # Fields
  it { should have_fields(:name, :description) }

  # Relations
  it { should embed_many :tiles }
end
