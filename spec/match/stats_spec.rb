require 'spec_helper'

RSpec.describe Flaki::Match::Stats do
  subject(:new_instance) { described_class.new }

  describe '#non_empty' do
    it "is 0 by default" do
      expect(new_instance.non_empty).to eq(0)
    end
  end

  describe '#non_empty=' do
    it "sets new value of non_empty" do
      new_instance.non_empty = 5
      expect(new_instance.non_empty).to eq(5)
    end
  end

  describe '#matching' do
    it "is 0 by default" do
      expect(new_instance.matching).to eq(0)
    end
  end

  describe '#matching=' do
    it "sets new value of matching" do
      new_instance.matching = 11
      expect(new_instance.matching).to eq(11)
    end
  end

  describe '#all' do
    it "is 0 by default" do
      expect(new_instance.all).to eq(0)
    end
  end

  describe '#all=' do
    it "sets new value of all" do
      new_instance.all = 42
      expect(new_instance.all).to eq(42)
    end
  end
end
