# frozen_string_literal: true

class Board
    attr_reader :moves, :cells, :winning_mark
    attr_writer :moves
    def initialize
        @cells = [1,2,3,4,5,6,7,8,9]
        @moves = 9
        @winning_mark = ''
    end

    #def display_board(n)
    #    array = n.each_slice(3).to_a
    #    puts ''
    #    puts '---|---|---'
    #    array.each do |i|
    #        line = ''
    #        i.each_with_index do |j,k|
    #            line += " #{j} #{'|'}" if k!=2
    #            line += " #{j}" if k==2
    #        end
    #        puts line
    #        puts '---|---|---'
    #    end
    #    puts ''
    #end

    def update_board(position,cursor)
        @cells[position.to_i-1] = cursor
    end

    def valid_position?(position)
        invalid = %w[X O]
        return !invalid.include?(@cells[position.to_i-1]) && (1...10).include?(position.to_i)
    end

    def win_condition
        win_state = [@cells.each_slice(3).to_a,
                     @cells.each_slice(3).to_a.transpose,
                     [[@cells[0],@cells[4],@cells[8]],
                     [@cells[2],@cells[4],@cells[6]]]].flatten(1)
        return win_state
    end

    def winner?
        win_condition.any? { |line| line.all?('X') || line.all?('O') }
    end

    def draw?
        return !winner? && @moves == 0
    end
end
