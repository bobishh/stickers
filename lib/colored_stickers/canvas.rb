require 'colored_stickers/sticker'

module ColoredStickers
  class Canvas
    attr_accessor :color, :width, :height, :body, :stickers
    def initialize(stickers:, size: [20, 10], color: 0)
      @width = size[0]
      @height = size[1]
      @body = Array.new(@height, Array.new(@width))
      @color = color
      @stickers = stickers.map { |attrs| Sticker.new(attrs) }
    end

    def render
      [*0..(@height-1)].map do |y|
        [*0..(@width-1)].map do |x|
          sticker_at(x, y).color
        end.join('')+"\n"
      end.join('')
    end

    def sticker_at(x,y)
      @stickers.select { |s| s.at?(x, y) }.dig(-1) || self
    end
  end
end
