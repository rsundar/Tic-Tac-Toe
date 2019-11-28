# frozen_string_literal:true

class Game
    attr_accessor :player1, :player2
    attr_reader :current_player, :board

    def initialize(player1_name, player2_name, current_player=nil, board=Board.new)
        @board = board
        @player1 = Player.new(player1_name, board.marker[:X])
        @player2 = Player.new(player2_name, board.marker[:O])
        @current_player = current_player || [@player1, @player2].sample(1).first
    end

    def turn(position)
        @board.update_board(position, @current_player.marker)
        @board.moves = @board.moves - 1
    end

    def switch_turn
        @current_player = @current_player == @player1 ? @player2 : @player1
    end

    def is_valid?(position)
        @board.valid_position?(position)
    end

    def cells
        @board.cells
    end

    def game_state
        return :winner if @board.winner?
        return :draw if @board.draw?
        :active
    end
end