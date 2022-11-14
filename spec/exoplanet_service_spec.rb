require './lib/exoplanet_service.rb'
require 'pry'

RSpec.describe ExoplanetService do
  let(:service)      { described_class.new }
  let(:planet_array) { service.collect_planet_data }
  let(:mock_data)    { {"PlanetIdentifier"=>"KOI-1843.03",
                        "TypeFlag"=>0,
                        "PlanetaryMassJpt"=>0.0014,
                        "RadiusJpt"=>0.054,
                        "PeriodDays"=>0.1768913,
                        "SemiMajorAxisAU"=>0.0048,
                        "Eccentricity"=>"",
                        "PeriastronDeg"=>"",
                        "LongitudeDeg"=>"",
                        "AscendingNodeDeg"=>"",
                        "InclinationDeg"=>72,
                        "SurfaceTempK"=>"",
                        "AgeGyr"=>"",
                        "DiscoveryMethod"=>"transit",
                        "DiscoveryYear"=>2012,
                        "LastUpdated"=>"13/07/15",
                        "RightAscension"=>"19 00 03.14",
                        "Declination"=>"+40 13 14.7",
                        "DistFromSunParsec"=>"",
                        "HostStarMassSlrMass"=>0.46,
                        "HostStarRadiusSlrRad"=>0.45,
                        "HostStarMetallicity"=>0,
                        "HostStarTempK"=>3584,
                        "HostStarAgeGyr"=>""} }

  before(:each) do
    allow_any_instance_of(described_class).to receive(:collect_planet_data).and_return([mock_data])
  end

  it 'exists' do
    expect(service).to be_instance_of(ExoplanetService)
  end

  it 'planet data is an array of hashes' do
    expect(planet_array.first).to be_a(Hash)
  end

  it 'can get the correct count of data from endpoint' do
    expect(planet_array.count).to eq(1)
  end

  it 'has data planet_identifer and star temp' do
    expect(planet_array.first["PlanetIdentifier"]).to be_a(String)
    expect(planet_array.first["HostStarTempK"]).to eq(3584)
  end
end
