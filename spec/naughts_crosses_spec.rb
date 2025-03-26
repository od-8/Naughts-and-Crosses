require_relative '../lib/naughts_crosses'

describe Game do
  subject(:new_game) { Game.new }

  describe '#move' do
    context 'can add characters to board' do
      it 'board should have an x at 1' do
        board = ['x',2,3,4,5,6,7,8,9]
        new_game.move(1, 'x')
        expect(new_game.board).to eq(board)
      end
    end
  end

  describe '#legal_move?' do
    context 'when move is legal' do
      it 'returns true' do
        valid_move = new_game.legal_move?(1)
        expect(valid_move).to be(true)
      end
    end
  end

  describe '#legal_move?' do
    context 'when move is illegal' do
      it 'returns false' do
        valid_move = new_game.legal_move?(10)
        expect(valid_move).to be(false)
      end
    end
  end

  describe '#winner?' do
    context 'when there is a winner horizontally' do
      before do 
        new_game.move(1, 'x')
        new_game.move(2, 'x')
        new_game.move(3, 'x')
      end

      it 'returns true' do
        game_over = new_game.winner?('x')
        expect(game_over).to be(true)
      end
    end
  end

  describe '#winner?' do
    context 'when there is a winner vertically' do
      before do 
        new_game.move(1, 'x')
        new_game.move(4, 'x')
        new_game.move(7, 'x')
      end

      it 'returns true' do
        game_over = new_game.winner?('x')
        expect(game_over).to be(true)
      end
    end
  end

  describe '#winner?' do
    context 'when there is a winner diagonally' do
      before do 
        new_game.move(1, 'x')
        new_game.move(5, 'x')
        new_game.move(9, 'x')
      end

      it 'returns true' do
        game_over = new_game.winner?('x')
        expect(game_over).to be(true)
      end
    end
  end

  describe '#full?' do
    context 'when the board is full and there are no winners' do
      before do
        new_game.move(1, 'x')
        new_game.move(2, 'o')
        new_game.move(3, 'o')
        new_game.move(4, 'o')
        new_game.move(5, 'x')
        new_game.move(6, 'x')
        new_game.move(7, 'x')
        new_game.move(8, 'o')
        new_game.move(9, 'o')
      end

      it 'returns true' do
        game_over = new_game.full?
        expect(game_over).to be(true)
      end
    end
  end
end