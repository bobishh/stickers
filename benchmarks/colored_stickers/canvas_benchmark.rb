require 'benchmark/ips'
require_relative '../../lib/colored_stickers/canvas'

Benchmark.ips do |x|
  # Configure the number of seconds used during
  # the warmup phase (default 2) and calculation phase (default 5)
  x.config(:time => 5, :warmup => 2)

  # Typical mode, runs the block as many times as it can
  x.report("render") { ColoredStickers::Canvas.new(stickers: [{color: '*', width: 5, height: 7, x: 1, y: 2}, {color: '-', width: 4, height: 3, x: 2, y: 3}], size: [100, 100], color: ' ').render }
  x.report("render2") { ColoredStickers::Canvas.new(stickers: [{color: '*', width: 500, height: 700, x: 100, y: 200}, {color: '-', width: 400, height: 300, x: 50, y: 400}], size: [1000, 1000], color: ' ').render }
  x.compare!
end
