# frozen_string_literal: true

require_relative '../lib/board'

describe Board do
  subject(:board) { described_class.new }

  describe '#fill_column' do
    context 'when user selects column 1' do
      it 'fills column 1' do
        expect { board.fill_column(0) }.to(change { board.instance_variable_get(:@board)[0][0] })
      end
    end
  end

  describe '#full_column?' do
    context 'when column is not full' do
      it 'returns false' do
        expect(board.full_column?(0)).to be false
      end
    end

    context 'when column is full' do
      it 'returns true' do
        ROWS = 6
        ROWS.times do
          board.fill_column(0)
        end
      end
    end
  end

  describe '#clear' do
    context 'when board is non-empty' do
      it 'clears the board' do
        clear_board = Array.new(Board::COLUMNS) { [] }
        board.fill_column(0)
        expect { board.clear }.to change { board.instance_variable_get(:@board) }.to eql(clear_board)
      end
    end

    context 'when board is empty' do
      it 'does nothing' do
        expect { board.clear }.not_to(change { board.instance_variable_get(:@board) })
      end
    end
  end
end
