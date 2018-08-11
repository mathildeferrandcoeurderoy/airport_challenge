require "weather"
describe Weather do

  it "verifies if the weather is stormy" do
    expect(subject).to be_stormy
  end

end
