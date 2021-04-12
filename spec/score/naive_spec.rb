require 'spec_helper'

RSpec.describe Flaki::Score::Naive do
  let(:non_empty) { 23 }
  let(:matching) { 19 }
  let(:all) { 24 }
  let(:stats) { double(Flaki::Match::Stats, non_empty: non_empty, matching: matching, all: all) }

  describe '#match' do
    subject { described_class.new(stats).match }

    it "gives a correct match" do
      expect(subject).to eq(0.8260869565217391) # we could use be_within() & of()
    end
  end

  describe '#overlap' do
    subject { described_class.new(stats).overlap }

    it "gives a correct overlap" do
      expect(subject).to eq(0.9583333333333334)
    end
  end

  describe '#overall' do
    subject { described_class.new(stats).overall }

    it "gives a correct overall" do
      expect(subject).to eq(0.7916666666666667)
    end
  end
end
