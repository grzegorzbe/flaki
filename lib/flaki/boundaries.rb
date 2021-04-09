module Flaki
  # Class calculates a boundaries that should be examined to scan for invaders.
  # It assumes thatwe should cover radar width and height extended by maximal
  # width of the biggest invader.
  #
  # It also provides a helper method for iterating over all locations.
  class Boundaries
    def initialize(radar, invaders)
      @radar = radar
      @invaders = invaders
    end

    def map_each_location
      rows.flat_map do |row|
        columns.flat_map do |column|
          yield [column, row]
        end
      end.compact
    end

    def columns
      min_column..max_column
    end

    def rows
      min_row..max_row
    end

    def min_column
      1 - max_invader_width
    end

    def max_column
      @radar.width + max_invader_width - 2
    end

    def min_row
      1 - max_invader_height
    end

    def max_row
      @radar.height + max_invader_height - 2
    end

    def max_invader_width
      @max_invader_width ||= @invaders.map(&:width).max
    end

    def max_invader_height
      @max_invader_height ||= @invaders.map(&:height).max
    end
  end
end
