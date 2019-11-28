require 'spec_helper'
require_relative '../lib/game.rb'
require_relative '../lib/board.rb'
require_relative '../lib/player.rb'

describe Game do
    let(:player1) { 'Rohan' }
    let(:player2) { 'Vivek' }
    let(:marker1) { 'X' }
    let(:marker2) { 'O' }
    subject(:game) { Game.new(player1, player2) }

    describe "Retrieve player names and markers" do
        it "Check if the Game object was created" do
            expect(game).to be_a Game
        end

        it "Retrieve player1's name. Should be Rohan" do
            expect(game.player1.name).to eq(player1)
        end

        it "Retrieve player2's name. Should be Vivek" do
            expect(game.player2.name).to eq(player2)
        end

        it "Retrieve player1's marker. Should be X" do
            expect(game.player1.marker).to eq(marker1)
        end

        it "Retrieve player2's marker. Should be O" do
            expect(game.player2.marker).to eq(marker2)
        end

        it "If new game is initialized the game state should be :active" do
            expect(game.game_state).to eq(:active)
        end
    end

    describe "Gameplay tests. Testing switching turns and board update." do
        let(:current_player) { Player.new(player1, marker1) }
        subject(:game) { Game.new( player1, player2, current_player ) }
        
        it "Check the current player, should be Rohan" do
            expect(game.current_player.name).to eq(player1)
        end

        it "Switch turn, current player should be Vivek" do
            initial_player = game.current_player
            game.switch_turn
            expect(game.current_player).not_to eq(initial_player)
        end

        it "Update board with a position. Check if the board has been updated" do
            initial_state = game.cells
            game.turn(5)
            expect(game.cells).to eq([1,2,3,4,'X',6,7,8,9])
        end
    end

    describe "Checking the functionality of the is_valid? method" do
        let(:default) {[1,2,3,'X',5,6,7,8,9]}
        let(:board) { Board.new(default, 8) }
        let(:current_player) { Player.new(player1, marker1) }
        subject(:game) { Game.new( player1, player2, current_player=nil, board) }

        it "Try to update the board at position 4. is_valid? should return false." do
            expect(game.is_valid?(4)).to be false
        end

        it "Try to update board at position 5. is_valid? should return true." do
            expect(game.is_valid?(5)).to be true
        end

        it "Try to update board at position 10. is_valid? should return false." do
            expect(game.is_valid?(10)).to be false
        end
    end

    describe "Game Won" do
        let(:win) { ['X',2,3,4,'X',6,7,8,'X'] }
        let(:current_player) { Player.new(player1, marker1) }
        let(:board) { Board.new(win,9) }
        subject(:game) { Game.new(player1, player2, current_player, board) }

        it "Check if there is a winner. game_state should return :winner" do
            expect(game.game_state).to eq(:winner)
        end
    end

    describe "Game Drawn" do
        let(:drawn) { ['X','O','X','X','O','X','O','X','O'] }
        let(:current_player) { Player.new(player1, marker1) }
        let(:board) { Board.new(drawn,0) }
        subject(:game) { Game.new(player1, player2, current_player, board) }

        it "Check if the game is a draw. game_state should return :draw" do
           expect(game.game_state).to eq(:draw) 
        end
    end
end