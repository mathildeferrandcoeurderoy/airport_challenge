require_relative "plane"
require_relative "weather"
DEFAULT_SIZE = 3

class Airport

  attr_reader :capacity

  def initialize(capacity = DEFAULT_SIZE, weather: Weather.new)
    @planes = []
    @weather = weather
    @capacity = capacity
  end

  def land(plane)
    raise "Plane can't land: stormy weather!" if @weather.stormy?
    raise "Plane can't land: airport is full!" if @planes.length >= @capacity
    @planes << plane
  end

  def take_off(plane)
    raise "Plane can't take off: stormy weather!" if @weather.stormy?
    @planes.pop
  end
end
