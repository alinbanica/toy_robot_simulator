# frozen_string_literal: true

class Table
  def initialize(width:, height:)
    @width = width
    @height = height
  end

  def valid_position?(x, y)
    (0...width).include?(x) && (0...height).include?(y)
  end

  private

  attr_reader :width, :height
end
