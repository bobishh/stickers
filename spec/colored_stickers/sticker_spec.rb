require 'spec_helper'
require_relative '../../lib/colored_stickers/sticker'

describe ColoredStickers::Sticker do
  let(:subject) { described_class.new(color: 4, x: 2, y: 5, width: 10, height: 10) }
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
