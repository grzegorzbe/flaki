require 'spec_helper'

RSpec.describe Flaki::Finding do
  let(:invader) { double(name: 'Invadeiro') }
  let(:score) { double(match: 0.875, overlap: 0.965) }
  let(:row) { 10 }
  let(:column) { 10 }
  subject { described_class.new(invader: invader, score: score, row: row, column: column) }

  describe '#to_s' do
    it 'returns string representation of finding details' do
      expected_value = "Invader Invadeiro hides at 10x10 with certainty of 0.88 and overlap of 0.97"
      expect(subject.to_s).to eq(expected_value)
    end
  end

  describe '#inspect' do
    it 'calls #to_s under the hood' do
      expect(subject).to receive(:to_s)
      subject.inspect
    end
  end
end
