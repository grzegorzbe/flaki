module Flaki
  module Score
    # Class calculates three factors using MatchStats data. Each of them can be value from 0 to 1:
    # - overlap - specifies if patterns fully overlap or any of them contains empty space.
    #   When both patterns have non-empty characters it takes 1, if any of them is empty
    #   then it takes 0
    # - match - how many of non-empty characters match in both patterns. If all non-empty
    #   chars are identical then it takes 1, for none it's 0
    # - score - product of overlap and match, the more points we have and more of them
    #   matches it's more probable invader hides here.
    #
    # Separate overlap and match factors allow for partial matching e.g. at the edges of
    # the radar data. We can e.g. assume that 50% overlap (overlap >= 0.5) with high match
    # at e.g. 90% is significant enough to consider it a hidden half-invader.
    class Naive < Base
      def overall
        @overall ||= match * overlap
      end

      def match
        @match ||= @stats.non_empty > 0 ? @stats.matching.fdiv(@stats.non_empty) : 0.0
      end

      def overlap
        @overlap ||= @stats.non_empty.fdiv(@stats.all)
      end
    end
  end
end
