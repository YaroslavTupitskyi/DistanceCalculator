require 'distance_calculator_with_math'

RSpec.describe DistanceCalculatorWithMath do
  describe '#calc_distances' do
    subject { described_class.call(coords) }

    let(:coords) do
      [
        ['2.78788', '3.578787'],
        ['3.6565', '55.6434'],
        ['10.833305983642491', '56.11816406250001'],
        ['19.559790136497412', '38.935546875'],
        ['5.703447982149503', '3.5595703125']
      ]
    end

    let(:error_msg) do
      "Latitude or Longitude is incorrect. Please, check parameters: [#{loc[0]}, #{loc[1]}]"
    end

    context 'with valid data' do
      it { is_expected.to eq([[5780.23], [799.74], [2081.2], [4123.2]]) }
    end

    context 'with invalid latitude' do
      let(:loc) { [latitude, coords.first[1]] }

      before { coords.first[0] = latitude }

      context 'in case latitude is text' do
        let(:latitude) { 'text' }

        it { expect { subject }.to raise_error(ArgumentError, error_msg) }
      end

      context 'in case latitude is incorrect' do
        let(:latitude) { '90.01' }

        it { expect { subject }.to raise_error(ArgumentError, error_msg) }
      end
    end

    context 'with invalid longitude' do
      let(:loc) { [coords.first[0], longitude] }

      before { coords.first[1] = longitude }

      context 'in case longitude is text' do
        let(:longitude) { 'text' }

        it { expect { subject }.to raise_error(ArgumentError, error_msg) }
      end

      context 'in case longitude is incorrect' do
        let(:longitude) { '180.01' }

        it { expect { subject }.to raise_error(ArgumentError, error_msg) }
      end
    end
  end
end
