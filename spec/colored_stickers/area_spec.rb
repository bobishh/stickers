require 'colored_stickers/area'
require 'colored_stickers/canvas'
require 'benchmark/ips'

describe ColoredStickers::Area do
  let(:sample_input1) do
    {
      stickers: [
        { color: 3, x: 1, y: 2, width: 7, height: 7 },
        { color: 2, x: 2, y: 3, width: 10, height: 2 }
      ],
      size: [20, 10],
      color: 0
    }
  end

  let(:sample_output1) do
		{0=>143, 3=>37, 2=>20}
  end
  let(:sample_input) do
    {
      stickers: [
        { color: 1, x: 5, y: 5, width: 10, height: 3 },
        { color: 2, x: 0, y: 0, width: 7, height: 7 }
      ],
      size: [20, 10],
      color: 0
    }
  end

  let(:sample_output) do
    {
      0 => 125,
      1 => 26,
      2 => 49
    }
  end

  let(:subject) { described_class.new(sample_input) }

  describe '#report' do
    it 'returns quantities of blocks taken by each color on sticker board' do
      expect(subject.report).to eq(sample_output)
    end
    describe 'triangulate!' do
      let(:subject) { described_class.new(sample_input1) }
      it 'returns correct value again' do
        expect(subject.report).to eq(sample_output1)
      end
    end
  end
end

Benchmark.ips do |x|
  x.config(:time => 5, :warmup => 2)
  x.report("render") { ColoredStickers::Canvas.new(stickers: [{color: '*', width: 5, height: 7, x: 1, y: 2}, {color: '-', width: 4, height: 3, x: 2, y: 3}], size: [100, 100], color: ' ').render }
  x.report("area") { ColoredStickers::Area.new(stickers: [{color: '*', width: 500, height: 700, x: 100, y: 200}, {color: '-', width: 400, height: 300, x: 50, y: 400}], size: [1000, 1000], color: ' ').report }
  x.compare!
end
