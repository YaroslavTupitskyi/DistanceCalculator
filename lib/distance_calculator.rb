require 'distance_calculator_with_math'

class DistanceCalculator
  VERSION = '0.0.1'.freeze

  def initialize(coords)
    @coords = coords
  end

  def calculate_distance_with_math
    DistanceCalculatorWithMath.call(@coords)
  end
end
