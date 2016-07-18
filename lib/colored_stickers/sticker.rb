# stickers module
module ColoredStickers
  # sticker class
  class Sticker
    attr_reader :color, :width, :height
    def initialize(color:, x:, y:, width:, height:)
      @color = color
      @x = x.to_i
      @y = y.to_i
      @width = width
      @height = height
    end

    def area
      @area ||= @width*@height
    end

    def overlap_area(sticker)
      x_overlap = overlap_1d(coordinates[:x1], coordinates[:x2], sticker.coordinates[:x1], sticker.coordinates[:x2])
      y_overlap = overlap_1d(coordinates[:y1], coordinates[:y2], sticker.coordinates[:y1], sticker.coordinates[:y2])
      x_overlap*y_overlap
    end

    def overlap_1d(c11, c12, c21, c22)
      [0,
       [c12, c22].min -
       [c11, c21].max
      ].max
    end

    def <=>(sticker)
      object_id <=> sticker.object_id
    end

    def coordinates
      { x1: @x, x2: @x+@width, y1: @y, y2: @y+@height }
    end

    def intersected?(sticker)
      borders.map { |b| sticker.at?(*b) }.include?(true)
    end

    def borders
      @borders ||= [[@x,@y], [@x, @y+@height], [@x+@width, @y], [@x+@width, @y+@height]]
    end

    def at?(x,y)
      @x <= x && (@x+@width) > x && @y <= y && (@y+@height) > y
    end
  end
end
