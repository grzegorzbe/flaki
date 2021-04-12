module Flaki
  module Match
    # Class implements naive matcher of two string patterns of the same length. Matcher
    # generates stats structure usable by e.g. Scores to evaluate a... score.
    class Naive < Base
      def stats
        @stats ||= patterns_array.each_with_object(Stats.new) do |(char1, char2), stats|
          stats.non_empty += 1 if char1 != @empty_char && char2 != @empty_char
          stats.matching += 1 if char1 == char2
          stats.all += 1
        end
      end

      def patterns_array
        @pattern1.chars.zip(@pattern2.chars)
      end
    end
  end
end
