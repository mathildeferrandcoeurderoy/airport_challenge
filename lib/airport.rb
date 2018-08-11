require_relative "plane"
require_relative "weather"

class Airport

  def initialize(weather: Weather.new)
    @planes = []
    @weather = weather
  end

  def land_in(plane)
    fail "Plane can't land: stormy weather!" if @weather.stormy?
  end

  def take_off_from(plane)
    fail "Plane can't take off: stormy weather!" if @weather.stormy?
  end
end
