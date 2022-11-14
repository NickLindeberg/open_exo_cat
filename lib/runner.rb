require './lib/exoplanet_service.rb'
require './lib/exoplanet.rb'
require './lib/exoplanet_repository.rb'
require 'pry'

class Runner
  attr_reader :run

  def self.run
    exo_service = ExoplanetService.new
    all_planets = exo_service.collect_planet_data
    planet_objects = all_planets.map { |p| Exoplanet.new(p) }
    repo = ExoplanetRepository.new(planet_objects)
    puts repo.timeline
    puts "********* There are #{repo.orphan_planet_count} orphan planets! *********"
    puts "********* #{repo.planet_with_hottest_star} is the planet with the hottest star *********"
  end
end

Runner.run
