RSpec.describe DistanceCalculator do
  it 'has a version number' do
    expect(DistanceCalculator::VERSION).not_to be nil
  end

  describe '#calculate_distance_with_math' do
    let(:distance_calculator) { described_class.new(coords) }

    let(:coords) do
      [
        ['2.78788', '3.578787'],
        ['3.6565', '55.6434'],
        ['10.833305983642491', '56.11816406250001'],
        ['19.559790136497412', '38.935546875'],
        ['5.703447982149503', '3.5595703125']
      ]
    end

    it 'receives DistanceCalculatorWithMath module' do
      expect(DistanceCalculatorWithMath).to receive(:call).with(coords)
      distance_calculator.calculate_distance_with_math
    end
  end
end
