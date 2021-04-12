module Flaki
  class Crawler
    def initialize(radar:, invaders:, min_match: Flaki::MIN_MATCH, min_overlap: Flaki::MIN_OVERLAP)
      @radar = radar
      @invaders = Array(invaders)
      @min_match = min_match
      @min_overlap = min_overlap
    end

    def findings
      boundaries.map_each_location do |column, row|
        @invaders.map do |invader|
          how_it_fits(column, row, invader)
        end
      end
    end

    private

    def how_it_fits(column, row, invader)
      stats = Match::Naive.new(pattern1: radar_pattern_at(column, row, invader), pattern2: invader.pattern).stats
      score = Score::Naive.new(stats)
      return if score.match < @min_match || score.overlap < @min_overlap

      Finding.new(invader: invader, score: score, row: row, column: column)
    end

    def radar_pattern_at(col, row, invader)
      @radar.pattern_at(col, row, invader.width, invader.height)
    end

    def boundaries
      @boundaries ||= Boundaries.new(@radar, @invaders)
    end
  end
end
