require "airport"
describe Airport do
  describe "#land_in method" do
    it "responds to land_in method" do
      expect(subject).to respond_to(:land_in).with(1).arguments
    end

    it "will not allow a plane to land if there is a storm" do
      plane = Plane.new
      expect { subject.land_in(plane) }.to raise_error("Plane can't land: stormy weather!")
    end
  end

  describe "#take_off_from method" do
    it "responds to take_off_from" do
      expect(subject).to respond_to(:take_off_from).with(1).arguments
    end

    it "will not allow a plane to take off if there is a storm" do
      plane = Plane.new
      expect { subject.take_off_from(plane) }.to raise_error("Plane can't take off: stormy weather!")
    end
  end

end
