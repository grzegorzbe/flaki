require 'spec_helper'

RSpec.describe Flaki::Boundaries do
  let(:radar) { double(width: 96, height: 74) }
  let(:invader1) { double(width: 10, height: 12) }
  let(:invader2) { double(width: 15, height: 10) }

  subject { described_class.new(radar, [invader1, invader2]) }

  describe '#max_invader_width' do
    it 'returns 15' do
      expect(subject.max_invader_width).to eq(15)
    end
  end

  describe '#max_invader_height' do
    it 'returns 12' do
      expect(subject.max_invader_height).to eq(12)
    end
  end

  describe '#min_column' do
    it 'returns -14' do
      expect(subject.min_column).to eq(-14)
    end
  end

  describe '#max_column' do
    it 'returns 109' do
      expect(subject.max_column).to eq(109)
    end
  end

  describe '#min_row' do
    it 'returns -11' do
      expect(subject.min_row).to eq(-11)
    end
  end

  describe '#max_row' do
    it 'returns 84' do
      expect(subject.max_row).to eq(84)
    end
  end

  describe '#columns' do
    it 'returns range from -14..109' do
      expect(subject.columns).to eq(-14..109)
    end
  end

  describe '#rows' do
    it 'returns range from -11..88' do
      expect(subject.rows).to eq(-11..84)
    end
  end

  describe '#map_each_location' do
    let(:radar) { double(width: 4, height: 3) }
    let(:invader1) { double(width: 1, height: 1) }
    let(:invader2) { double(width: 1, height: 1) }

    it 'iterates over all fields' do
      expected_result = (0..3).to_a.product((0..2).to_a).map { |column, row| "#{row}_#{column}" }
      result = subject.map_each_location { |column, row| "#{row}_#{column}" }

      expect(result).to match_array(expected_result)
    end
  end
end
