module ColoredStickers
	class Sticker
    attr_reader :color, :width, :height
		def initialize(color:, x:, y:, width:, height:)
			@color = color
			@x = x.to_i
			@y = y.to_i
			@width = width
			@height = height
		end

		def coordinates
			{ x: @x, y: @y }
		end

		def at?(x,y)
      @x <= x && (@x+@width) > x && @y <= y && (@y+@height) > y
		end
	end
end
