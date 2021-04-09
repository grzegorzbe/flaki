module Flaki
  # Class represents an AsciiArt which can be a radar sample, invader
  # or anything else. Assumption is that each AsciiArt is rectangular
  # so it has identical width for each line.
  #
  # TODO: add support for non-rectangular AA (guess the padding)
  class AsciiArt
    attr_reader :name, :data, :height, :width

    def initialize(name)
      @name = name
      @data = Hash.new(Flaki::EMPTY_CHAR)
      @height = 0
      @width = 0
    end

    def from_string(string)
      lines = string.split("\n").compact

      @height = lines.size
      @width = lines.first.size

      lines.each_with_index do |line, row|
        line.chars.each_with_index do |char, column|
          @data[[row, column]] = char
        end
      end

      self
    end

    def pattern
      @pattern ||= pattern_at(0, 0, @width, @height)
    end

    def pattern_at(col1, row1, width, height)
      col2 = col1 + width - 1
      row2 = row1 + height - 1

      # (row1..row2).to_a.product((col1..col2).to_a).map do |(row, column)|
      #   @data[[row, column]]
      # end.join

      (row1..row2).flat_map do |row|
        (col1..col2).map do |column|
          @data[[row, column]]
        end
      end.join
    end

    def inspect
      "Name: #{@name}"
    end
  end
end
