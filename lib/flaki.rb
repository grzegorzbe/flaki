require 'ostruct'

require 'flaki/match/stats'
require 'flaki/match/base'
require 'flaki/match/naive'

require 'flaki/score/base'
require 'flaki/score/naive'

require 'flaki/ascii_art'
require 'flaki/crawler'
require 'flaki/finding'
require 'flaki/boundaries'

module Flaki
  EMPTY_CHAR = 'X'.freeze
  MIN_MATCH = 0.75
  MIN_OVERLAP = 0.50
  DEFAULT_ROUNDING = 2
end
