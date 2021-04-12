module Flaki
  class Finding
    def initialize(invader:, score:, row:, column:)
      @invader = invader
      @score = score
      @row = row
      @column = column
    end

    def to_s
      "Invader #{@invader.name} " \
      "hides at #{@column}x#{@row} " \
      "with certainty of #{@score.match.round(Flaki::DEFAULT_ROUNDING)} " \
      "and overlap of #{@score.overlap.round(Flaki::DEFAULT_ROUNDING)}"
    end

    def inspect
      to_s
    end
  end
end
