require './lib/exoplanet.rb'
require './lib/exoplanet_repository.rb'
require 'pry'

RSpec.describe ExoplanetRepository do
  let(:planet_data) { {"PlanetIdentifier"=>"Rad Planet",
                       "HostStarTempK"=>1290,
                       "DiscoveryYear"=>1986,
                       "RadiusJpt"=>0.054 } }
  let(:orphan_planet_data) { {"PlanetIdentifier"=>"Lonely Planet",
                              "HostStarTempK"=>"",
                              "DiscoveryYear"=>2019,
                              "RadiusJpt"=>1.9 } }
  let(:planet_data_hot_star) { {"PlanetIdentifier"=>"Even Radder Planet",
                              "HostStarTempK"=>500000,
                              "DiscoveryYear"=>1986,
                              "RadiusJpt"=>2.9 } }

  let(:planet) { Exoplanet.new(planet_data) }
  let(:planet_hot_star) { Exoplanet.new(planet_data_hot_star) }
  let(:orphan_planet) { Exoplanet.new(orphan_planet_data) }

  let(:planets) { [planet, planet_hot_star, orphan_planet] }
  let(:exo_repo) { ExoplanetRepository.new(planets) }

  it 'exists' do
    expect(exo_repo).to be_instance_of(ExoplanetRepository)
  end

  it 'contains all planets' do
    expect(exo_repo.all_planets.count).to eq(3)
  end

  it 'shows number of orphan planets' do
    expect(exo_repo.orphan_planet_count).to eq(1)
  end

  it 'shows planet identifier with hottest star' do
    expect(exo_repo.planet_with_hottest_star).to eq("Even Radder Planet")
  end

  it 'gives timeline of when exoplanets were discovered and planet sizes' do
    string = "In 1986 we discovered 1 large planets, 0 medium and 1 small.\nIn 2019 we discovered 0 large planets, 1 medium and 0 small."
    expect(exo_repo.timeline).to eq(string)
  end
end
