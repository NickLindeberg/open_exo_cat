class Exoplanet
  attr_reader :planet_identifer, :star_temp

  def initialize(data)
    @planet_identifer = data["PlanetIdentifier"]
    @star_temp = data["HostStarTempK"] == "" ? 0 : data["HostStarTempK"]
  end
end
