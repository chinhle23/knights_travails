# frozen_string_literal: true

# The vertex objects that make up a graph
class Vertex
  attr_accessor :data, :left, :right

  def initialize(square)
    @current = square
    @two_left_one_up = nil
    @two_left_one_down = nil
    @two_up_one_left = nil
    @two_up_one_right = nil
    @two_right_one_up = nil
    @two_right_one_down = nil
    @two_down_one_left = nil
    @two_down_one_right = nil
  end
end