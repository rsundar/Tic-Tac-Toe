# frozen_string_literal:true

class Game
    attr_accessor :player1, :player2
    attr_reader :current_player, :board

    def initialize
        @board = Board.new
        @player1 = Player.new('X')
        @player2 = Player.new('O')
        @current_player = [@player1,@player2].sample(1).first
    end

    def turn(position)
        @board.update_board(position,@current_player.marker)
    end

    def switch_turn
        @current_player = @current_player == @player1? @player2 : @player1
    end

    def game_state
        return :winner if @board.winner?
        return :draw if @board.draw?
        :active
    end
end