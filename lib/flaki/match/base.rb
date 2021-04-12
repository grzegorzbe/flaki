module Flaki
  # Matchers are classes comparing two string patterns and returning stats structure
  # describing how similar patterns are
  module Match
    class Base
      def initialize(pattern1:, pattern2:, empty_char: Flaki::EMPTY_CHAR)
        @pattern1 = pattern1
        @pattern2 = pattern2
        @empty_char = empty_char
      end

      def stats
        raise NotImplementedError
      end
    end
  end
end
