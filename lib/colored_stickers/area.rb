require 'colored_stickers/sticker'
require 'pry'

module ColoredStickers
  class Area
    def initialize(stickers:[], size:[20, 10], color: 0)
      @width = size[0]
      @height = size[1]
      @color = color
      @board = Sticker.new(x: 0, y: 0, width: @width, height: @height, color: @color)
      @stickers = stickers.map { |s| Sticker.new(s) }.unshift(@board)
    end

    def report
      @report ||= calculate
    end

    private

    def calculate
      @stickers.each_with_index.map do |sticker, index|
        other_stickers = @stickers[(index)..-1].reject { |item| item == sticker }
        linked = intersections(sticker, other_stickers)
        area = visible_area(sticker, permutations(sticker, linked))
        Struct.new(:color, :area).new(sticker.color, area)
      end.each_with_object({}) do |color, acc|
        acc[color.color] ||= 0
        acc[color.color] += color.area
      end
    end

    def intersections(elem, list)
      list.select { |item| item.intersected?(elem) }
    end

    def permutations(sticker, array)
      (array << sticker).flatten.permutation(2).to_a.map(&:sort).uniq
    end

    def visible_area(sticker, permutations)
      area = sticker.area -
        summary_overlap_area(sticker, permutations) { |p, s| p.include?(s) } +
        summary_overlap_area(sticker, permutations) { |p, s| !p.include?(s) }
      area
    end

    def summary_overlap_area(sticker, permutations)
      area =
      permutations.select { |p| yield(p, sticker) }.map do |pair|
        pair[0].overlap_area(pair[1])
      end.reduce(&:+) || 0
      area
    end
  end
end
