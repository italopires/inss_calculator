require 'rails_helper'

RSpec.describe InssCalculator do
  describe '.calculate' do
    let(:instance) { double(:inss_calculator) }
    let(:salary) { 3000 }

    it 'instantiate and calls calculate', aggreate_failures: true do
      expect(described_class).to receive(:new).with(salary).and_return(instance)
      expect(instance).to receive(:calculate)

      described_class.calculate(salary)
    end
  end

  describe '#calculate' do
    subject { described_class.new salary }

    context 'when salary is 1045' do
      let(:salary) { 1045 }

      it 'returns inss_calculation' do
        expect(subject.calculate).to eq 78.37
      end
    end

    context 'when salary is 2089.6' do
      let(:salary) { 2089.6 }

      it 'returns inss_calculation' do
        expect(subject.calculate).to eq 94.01
      end
    end

    context 'when salary is 3000' do
      let(:salary) { 3000 }

      it 'returns inss_calculation' do
        expect(subject.calculate).to eq 109.24
      end
    end
  end
end