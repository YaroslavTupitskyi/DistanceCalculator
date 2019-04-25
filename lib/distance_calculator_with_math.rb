module DistanceCalculatorWithMath
  extend self

  RAD_PER_DEG = (Math::PI / 180).freeze
  R = 6371
  LATITUDE_REGEXP = /^(\+|-)?(90(\.0{1,})?|([0-9]|[1-8][0-9])(\.[0-9]{1,})?)$/.freeze
  LONGITUDE_REGEXP = /^(\+|-)?(?:180(\.0{1,})?|([0-9]|[1-9][0-9]|1[0-7][0-9])(\.[0-9]{1,})?)$/.freeze

  def call(coords)
    coords.each_cons(2).map { |coord1, coord2| [distance(coord1, coord2).round(2)] }
  end

  private

  def distance(coord1, coord2)
    check_locations([coord1, coord2])
    coord1 = convert_to_radians(coord1)
    coord2 = convert_to_radians(coord2)
    calculate_haversin(coord1, coord2)
  end

  def check_locations(locations = [])
    locations.each { |l| validate_location(*l) }
  end

  def validate_location(lat, lng)
    return if lat =~ LATITUDE_REGEXP && lng =~ LONGITUDE_REGEXP

    raise ArgumentError, error_message(lat, lng)
  end

  def deg_to_rad(deg)
    deg * RAD_PER_DEG
  end

  def convert_to_radians(arr)
    arr.map { |e| deg_to_rad(e.to_f) }
  end

  def calculate_haversin(coord1, coord2)
    lat1, lng1 = coord1
    lat2, lng2 = coord2

    h = haversin(lat2 - lat1) +
        Math.cos(lat1) * Math.cos(lat2) *
        haversin(lng2 - lng1)

    2 * R * Math.asin(Math.sqrt(h))
  end

  def haversin(rad)
    Math.sin(rad / 2)**2
  end

  def error_message(lat, lng)
    "Latitude or Longitude is incorrect. Please, check parameters: [#{lat}, #{lng}]"
  end
end
