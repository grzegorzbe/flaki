#!/usr/bin/env ruby

libdir = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require 'flaki'
require_relative 'inputs'

class Runner
  def initialize(min_match: Flaki::MIN_MATCH, min_overlap: Flaki::MIN_OVERLAP)
    @min_match = min_match
    @min_overlap = min_overlap
  end

  def call
    puts "That's what has been found using default sensitivity:"
    crawler.findings.each { |finding| puts "- #{finding}" }
  end

  private

  def crawler
    @crawler ||= Flaki::Crawler.new(radar: radar, invaders: invaders)
  end

  def radar
    Flaki::AsciiArt.new('Radar noise').from_string(DEFAULT_SAMPLE)
  end

  def invaders
    [
      Flaki::AsciiArt.new('Edźwin').from_string(INVADER_1),
      Flaki::AsciiArt.new('Filomena').from_string(INVADER_2)
    ]
  end
end

Runner.new.call
