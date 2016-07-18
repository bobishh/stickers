require 'colored_stickers/sticker'

describe ColoredStickers::Sticker do
  let(:subject) do
    described_class.new(color: 4,
                        x: 2, y: 5,
                        width: 10, height: 10)
  end

  describe '#coordinates' do
    it 'returns a hash with x and y keys as coordinates' do
      expect(subject.coordinates).to eq({:x1=>2, :x2=>12, :y1=>5, :y2=>15})
    end
  end

  it '#area returns area of a sticker' do
    expect(subject.area).to eq(100)
  end

  describe 'intersected?' do
    it 'returns true if sticker intersects with another' do
      expect(subject.intersected?(subject)).to eq(true)
    end
  end

  describe '#borders' do
    it 'returns borders of a sticker in abs. coordinates' do
      expect(subject.borders).to eq([[2, 5], [2, 15], [12, 5], [12, 15]])
    end
  end

  describe '#overlap_area' do
    it 'returns how many cells a sticker cuts from another' do
      expect(subject.overlap_area(subject)).to eq(100)
    end
  end

  describe '#at?' do
    it 'returns true if point(x,y) is located on sticker' do
      expect(subject.at?(4, 6)).to eq(true)
    end

    it 'returns true if point(x,y) is located on sticker' do
      expect(subject.at?(10, 10)).to eq(true)
    end

    it 'returns false if point(x,y) is not located on sticker' do
      expect(subject.at?(40, 60)).to eq(false)
    end
  end
end
