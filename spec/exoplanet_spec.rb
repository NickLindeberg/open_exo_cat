require './lib/exoplanet.rb'

RSpec.describe Exoplanet do
  let(:planet_data) { {"PlanetIdentifier"=>"Rad Planet", "HostStarTempK"=>1290 } }
  let(:planet) { Exoplanet.new(planet_data)}
  let(:orphan_planet_data) { {"PlanetIdentifier"=>"Lonely Planet", "HostStarTempK"=>""} }
  let(:orphan_planet) { Exoplanet.new(orphan_planet_data) }

  it 'exists' do
    expect(planet).to be_instance_of(Exoplanet)
  end

  it 'has attributes' do
    expect(planet.planet_identifer).to eq("Rad Planet")
    expect(planet.star_temp).to eq(1290)
  end

  it 'can create orphan planet' do
    expect(orphan_planet.planet_identifer).to eq("Lonely Planet")
    expect(orphan_planet.star_temp).to eq("")
  end
end
