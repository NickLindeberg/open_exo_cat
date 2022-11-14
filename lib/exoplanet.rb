class Exoplanet
  attr_reader :planet_identifer,
              :star_temp,
              :size,
              :discovery_year

  def initialize(data)
    @planet_identifer = data["PlanetIdentifier"]
    @star_temp = data["HostStarTempK"] == "" ? 0 : data["HostStarTempK"]
    @size = data["RadiusJpt"]
    @discovery_year = data["DiscoveryYear"]
  end

  def tshirt_size
    if @size == ""
      nil
    else
      if @size < 1
        "small"
      elsif @size < 2
        "medium"
      else
        "large"
      end
    end
  end
end
