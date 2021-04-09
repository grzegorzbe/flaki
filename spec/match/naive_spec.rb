require 'spec_helper'

RSpec.shared_context 'full pattern overlap' do
  it 'finds 7 non-empty characters' do
    expect(subject.non_empty).to eq(7)
  end

  it 'finds 7 characters in total' do
    expect(subject.all).to eq(7)
  end
end

RSpec.shared_context 'partial pattern overlap' do
  it 'finds 5 non-empty characters' do
    expect(subject.non_empty).to eq(5)
  end

  it 'finds 7 characters in total' do
    expect(subject.all).to eq(7)
  end
end

RSpec.describe Flaki::Match::Naive do
  describe '#stats' do
    subject { described_class.new(pattern1: pattern1, pattern2: pattern2).stats }

    context 'with full overlap' do
      context 'when patterns fully match' do
        include_context 'full pattern overlap'

        let(:pattern1) { 'A--A--A' }
        let(:pattern2) { 'A--A--A' }

        it 'finds 7 matching characters' do
          expect(subject.matching).to eq(7)
        end
      end

      context 'when patterns partially match' do
        include_context 'full pattern overlap'

        let(:pattern1) { 'A--AA--' }
        let(:pattern2) { 'AA-A--A' }

        it 'finds 4 matching characters' do
          expect(subject.matching).to eq(4)
        end
      end

      context "when patterns don't match" do
        include_context 'full pattern overlap'

        let(:pattern1) { 'A-A-A--' }
        let(:pattern2) { '-A-A-AA' }

        it 'finds 0 matching characters' do
          result = subject.matching
          expect(result).to eq(0)
        end
      end
    end

    context 'with partial overlap' do
      context 'when patterns fully match' do
        include_context 'partial pattern overlap'

        let(:pattern1) { 'A--A-XX' }
        let(:pattern2) { 'A--A--A' }

        it 'finds 5 matching characters' do
          expect(subject.matching).to eq(5)
        end
      end

      context 'when patterns partially match' do
        include_context 'partial pattern overlap'

        let(:pattern1) { 'A--AAXX' }
        let(:pattern2) { 'AA-A--A' }

        it 'finds 3 matching characters' do
          expect(subject.matching).to eq(3)
        end
      end

      context "when patterns don't match" do
        include_context 'partial pattern overlap'

        let(:pattern1) { 'A-A-AXX' }
        let(:pattern2) { '-A-A-AA' }

        it 'finds 0 matching characters' do
          result = subject.matching
          expect(result).to eq(0)
        end
      end
    end

    context 'with no overlap' do
      let(:pattern1) { 'XXXXXXX' }
      let(:pattern2) { 'A--A--A' }

      it 'finds 0 matching characters' do
        expect(subject.matching).to eq(0)
      end

      it 'finds 0 non-empty characters' do
        expect(subject.non_empty).to eq(0)
      end

      it 'finds 7 characters in total' do
        expect(subject.all).to eq(7)
      end
    end
  end
end
