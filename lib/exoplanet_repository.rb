class ExoplanetRepository
  require './lib/exoplanet'
  require 'pry'
  attr_reader :all_planets

  def initialize(planets)
    @all_planets = planets
  end

  def orphan_planet_count
    @all_planets.find_all { |p| p.star_temp == 0 }.count
  end

  def planet_with_hottest_star
    @all_planets.max_by { |p| p.star_temp }.planet_identifer
  end

  def timeline
    array = []
    years = @all_planets.group_by { |p| p.discovery_year }
    sorted = years.sort_by { |k, v| k.to_i }.to_h
    sorted.map do |y|
      counts = y[1].group_by { |p| p.tshirt_size }.transform_values { |values| values.count }
      l = counts["large"] || 0
      m = counts["medium"] || 0
      s = counts["small"] || 0
      year = y[0] == "" ? "Some Unknown Year" : y[0]
      "In #{year} we discovered #{l} large planets, #{m} medium and #{s} small."
    end.join("\n")
  end
end
