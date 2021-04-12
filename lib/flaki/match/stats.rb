module Flaki
  module Match
    class Stats
      attr_accessor :non_empty, :matching, :all

      def initialize
        @non_empty = 0
        @matching = 0
        @all = 0
      end
    end
  end
end
