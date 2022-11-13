require './lib/exoplanet.rb'
require 'pry'

RSpec.describe Exoplanet do
  let(:planet_data) { {"PlanetIdentifier"=>"Rad Planet",
                       "HostStarTempK"=>1290,
                       "DiscoveryYear"=>2012,
                       "RadiusJpt"=>0.054 } }
  let(:orphan_planet_data) { {"PlanetIdentifier"=>"Lonely Planet",
                              "HostStarTempK"=>"",
                              "DiscoveryYear"=>2019,
                              "RadiusJpt"=>1.9 } }
  let(:large_planet_data) { {"PlanetIdentifier"=>"Grande Planet",
                              "HostStarTempK"=>2900,
                              "DiscoveryYear"=>1986,
                              "RadiusJpt"=>2.9 } }

  let(:planet) { Exoplanet.new(planet_data)}
  let(:orphan_planet) { Exoplanet.new(orphan_planet_data) }
  let(:large_planet) { Exoplanet.new(large_planet_data)}

  it 'exists' do
    expect(planet).to be_instance_of(Exoplanet)
  end

  it 'has attributes' do
    expect(planet.planet_identifer).to eq("Rad Planet")
    expect(planet.star_temp).to eq(1290)
    expect(planet.discovery_year).to eq(2012)
    expect(planet.size).to eq(0.054)
  end

  it 'can create orphan planet' do
    expect(orphan_planet.planet_identifer).to eq("Lonely Planet")
    expect(orphan_planet.star_temp).to eq(0)
    expect(orphan_planet.discovery_year).to eq(2019)
    expect(orphan_planet.size).to eq(1.9)
  end

  it 'can assign small, medium or large to planet' do
    expect(planet.tshirt_size).to eq("small")
    expect(orphan_planet.tshirt_size).to eq("medium")
    expect(large_planet.tshirt_size).to eq("large")
  end
end
