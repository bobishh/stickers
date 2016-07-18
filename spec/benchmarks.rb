LIB_PATH = File.expand_path('../../lib', __FILE__).freeze
$LOAD_PATH.unshift(LIB_PATH)

require 'benchmark/ips'
require 'colored_stickers/canvas'
require 'colored_stickers/area'

Benchmark.ips do |x|
  x.config(:time => 5, :warmup => 2)
  x.report("render") { ColoredStickers::Canvas.new(stickers: [{color: '*', width: 5, height: 700, x: 100, y: 2}, {color: '-', width: 400, height: 300, x: 2, y: 3}], size: [1000, 1000], color: ' ').render }
  x.report("area") { ColoredStickers::Area.new(stickers: [{color: '*', width: 500, height: 700, x: 100, y: 200}, {color: '-', width: 400, height: 300, x: 50, y: 400}], size: [1000, 1000], color: ' ').report }
  x.compare!
end
