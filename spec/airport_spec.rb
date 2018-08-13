require "airport"
describe Airport do

  describe "#initialize" do
    it "set default capacity value when not submitted" do
      airport = Airport.new
      expect(airport.capacity).to eq DEFAULT_SIZE
    end
  end

  context 'when not stormy' do
    describe "#land method" do
      it "responds to land method" do
        expect(subject).to respond_to(:land).with(1).arguments
      end

      it "will not allow a plane to land if airport full" do
        allow(subject.weather).to receive(:stormy?).and_return false
        plane = Plane.new
        DEFAULT_SIZE.times { subject.land(Plane.new) }
        expect { subject.land(plane) }.to raise_error("Plane can't land: airport is full!")
      end

      it "verifies if a landed plane is at the airport" do
        allow(subject).to receive(:stormy?).and_return false
        plane = Plane.new
        subject.land(plane)
        expect(subject.planes.include?(plane)).to eq true
      end

      it "verifies that a landed plane cannot land again" do
        allow(subject).to receive(:stormy?).and_return false
        plane = Plane.new
        subject.land(plane)
        expect { subject.land(plane) }.to raise_error("Plane can't land: already at the airport!")
      end
    end
  end

  context 'when stormy' do
    it "will not allow a plane to land if there is a storm" do
      allow(subject.weather).to receive(:stormy?).and_return true
      plane = Plane.new
      expect { subject.land(plane) }.to raise_error("Plane can't land: stormy weather!")
    end
  end

  describe "#take_off method" do
    it "responds to take_off" do
      expect(subject).to respond_to(:take_off).with(1).arguments
    end

    context 'when stormy' do
      it "will not allow a plane to take off if there is a storm" do
        allow(subject.weather).to receive(:stormy?).and_return true
        plane = Plane.new
        expect { subject.take_off(plane) }.to raise_error("Plane can't take off: stormy weather!")
      end
    end

    it "verifies if a plane is already flying" do
      allow(subject).to receive(:stormy?).and_return false
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      expect { subject.take_off(plane) }.to raise_error("Plane is already flying!")
    end

  end

end
