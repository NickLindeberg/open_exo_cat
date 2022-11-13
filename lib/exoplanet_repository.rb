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
end


#
# {"PlanetIdentifier"=>"KOI-1843.03",
#  "TypeFlag"=>0,
#  "PlanetaryMassJpt"=>0.0014,
#  "RadiusJpt"=>0.054,
#  "PeriodDays"=>0.1768913,
#  "SemiMajorAxisAU"=>0.0048,
#  "Eccentricity"=>"",
#  "PeriastronDeg"=>"",
#  "LongitudeDeg"=>"",
#  "AscendingNodeDeg"=>"",
#  "InclinationDeg"=>72,
#  "SurfaceTempK"=>"",
#  "AgeGyr"=>"",
#  "DiscoveryMethod"=>"transit",
#  "DiscoveryYear"=>2012,
#  "LastUpdated"=>"13/07/15",
#  "RightAscension"=>"19 00 03.14",
#  "Declination"=>"+40 13 14.7",
#  "DistFromSunParsec"=>"",
#  "HostStarMassSlrMass"=>0.46,
#  "HostStarRadiusSlrRad"=>0.45,
#  "HostStarMetallicity"=>0,
#  "HostStarTempK"=>3584,
#  "HostStarAgeGyr"=>""}
