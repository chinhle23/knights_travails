# frozen_string_literal: true

require_relative 'vertex'

# This houses the methods of a knight graph representing the possible moves of a knight piece in chess
class KnightGraph
  attr_accessor :root, :lower_limit, :upper_limit

  def initialize(start)
    @root = build_graph(start)
    @lower_limit = 0
    @upper_limit = 7
  end
end