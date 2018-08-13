require_relative "plane"
require_relative "weather"
DEFAULT_SIZE = 3

class Airport

  attr_reader :capacity, :planes, :weather

  def initialize(capacity = DEFAULT_SIZE, weather: Weather.new)
    @planes = []
    @weather = weather
    @capacity = capacity
  end

  def land(plane)
    raise "Plane can't land: stormy weather!" if @weather.stormy?
    raise "Plane can't land: airport is full!" if @planes.length >= @capacity
    raise "Plane can't land: already at the airport!" if @planes.include?(plane)
    @planes << plane
  end

  def take_off(plane)
    raise "Plane can't take off: stormy weather!" if @weather.stormy?
    raise "Plane is already flying!" unless @planes.include?(plane)
    @planes.delete(plane)
  end
end
