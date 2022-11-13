class Exoplanet
  attr_reader :planet_identifer, :star_temp

  def initialize(planet_data)
    @planet_identifer = planet_data["PlanetIdentifier"]
    @star_temp = planet_data["HostStarTempK"]
  end
end
