require 'plane'

describe Plane do

  it "responds to the land method" do
    expect(subject).to respond_to :land
  end

  it "responds to the take_off method" do
    expect(subject).to respond_to :take_off
  end

end
