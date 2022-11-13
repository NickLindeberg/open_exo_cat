require './lib/exoplanet_service.rb'
require 'pry'

RSpec.describe ExoplanetService do
  let(:service)      { described_class.new }
  let(:planet_array) { service.collect_planet_data }

  it 'exists' do
    expect(service).to be_instance_of(ExoplanetService)
  end

  it 'planet data is an array of hashes' do
    expect(planet_array.first).to be_a(Hash)
  end

  it 'can get the correct count of data from endpoint' do
    expect(planet_array.count).to eq(3426)
  end

  it 'has data planet_identifer' do
    expect(planet_array.first["PlanetIdentifier"]).to be_a(String)
    expect(planet_array.first["HostStarTempK"]).to eq(3584)
  end
end
