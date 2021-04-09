module Flaki
  module Score
    # Scores classes calculate three factors using Match stats data. Each of them can be
    # value from 0 to 1:
    # - overlap - specifies if patterns fully overlap or any of them contains empty space.
    #   When both patterns have only non-empty characters it takes 1, if all of them are empty
    #   then it takes 0
    # - match - how many of non-empty characters match in both patterns. If all non-empty
    #   chars are identical then it takes 1, for none it's 0
    # - overall - product of overlap and match, the more points we have and more of them
    #   matches it's more probable invader hides here
    #
    # Separate overlap and match factors allow for partial matching e.g. at the edges of
    # the radar data. We can e.g. assume that 50% overlap (overlap >= 0.5) with high match
    # at e.g. 90% is significant enough to consider it a hidden half-invader.
    class Base
      def initialize(stats)
        @stats = stats
      end

      def overall
        raise NotImplementedError
      end

      def match
        raise NotImplementedError
      end

      def overlap
        raise NotImplementedError
      end
    end
  end
end
