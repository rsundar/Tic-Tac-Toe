require 'rspec'
require_relative '../lib/board.rb'

describe Board do
    let(:default) {[1,2,3,4,5,6,7,8,9]}
    let(:winner) {['X',2,3,4,'X',6,7,8,'X']}
    let(:draw) {['X','O','X','X','O','X','O','X','O']}
    let(:moves) {9}

    describe "Check if Board is created" do
        subject(:board) { Board.new(default,moves) }
        
        it "Check if board object is created" do
            expect(board).to be_a(Board)
        end

        it "Check the cells of the board" do
            expect(board.cells).to eq([1,2,3,4,5,6,7,8,9])
        end

        it "Check the number of moves available" do
            expect(board.moves).to eq(9)
        end
    end

    describe "Check if empty board is created when no parameters are passed" do
        subject(:board) { Board.new }

        it "Check if the board is created" do
            expect(board).to be_a(Board)
        end

        it "Check if the default layout of cells is created" do
            expect(board.cells).to eq([1,2,3,4,5,6,7,8,9])
        end

        it "Check if the default number of moves is created" do
            expect(board.moves).to eq(9)
        end
    end

    describe "Winning Board" do
        subject(:board) { Board.new(winner,moves) }

        it "Check if the board is created" do
            expect(board).to be_a(Board)
        end

        it "Check if the winning layout is initialized" do
            expect(board.cells).to eq(winner)
        end

        it "Check if the board has a winner. Should return true" do
            expect(board.winner?).to be true
        end

        it "The draw? method should return false" do
            expect(board.draw?).to be false
        end
    end

    describe "Drawn game" do
        let(:moves) {0}
        subject(:board) { Board.new(draw,moves) }

        it "Check if the board is created" do
            expect(board).to be_a(Board)
        end

        it "Check if the drawn board layout is initialized" do
            expect(board.cells).to eq(draw)
        end

        it "Check if the number of moves available is 0" do
            expect(board.moves).to eq(0)
        end

        it "Check if the game is a draw. Should be true" do
            expect(board.draw?).to be true
        end

        it "The winner? method should return false" do
            expect(board.winner?).to be false
        end
    end

    describe "Updating the board" do
        let(:position) {4}
        let(:marker) {'O'}
        let(:new_board) {[1,2,3,'O',5,6,7,8,9]}
        subject(:board) { Board.new(default,moves) }

        it "Update the board by placing a marker and check if it returns the correct board state." do
            board.update_board(position,marker)
            expect(board.cells).to eq(new_board)
        end

        it "Update the board again at the same position to see if it returns an invalid position" do
            board.update_board(4,'O')
            expect(board.valid_position?(position)).to be false
        end

        it "Update the board at a new location to see if the method returns true" do
            expect(board.valid_position?(5)).to be true
        end
    end
end