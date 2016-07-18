require 'spec_helper'
require 'colored_stickers/canvas'

describe ColoredStickers::Canvas do
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
		"22222220000000000000\n"\
		"22222220000000000000\n"\
		"22222220000000000000\n"\
		"22222220000000000000\n"\
		"22222220000000000000\n"\
		"22222221111111100000\n"\
		"22222221111111100000\n"\
		"00000111111111100000\n"\
		"00000000000000000000\n"\
		"00000000000000000000\n"
	end

  describe 'render' do
		it 'prints out canvas with stickers' do
			expect(described_class.new(sample_input).render).to eq(sample_output)
		end
	end
end
