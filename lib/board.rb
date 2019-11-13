require_relative './display_module'

class board
    attr_reader :moves, :cells, :no_winner
    def initialize
        @cells = [1,2,3,4,5,6,7,8,9]
        @moves = 9
        @no_winner = true
    end

    def display_board(n)
        array = n.each_slice(3).to_a
        puts ''
        puts '---|---|---'
        array.each do |i|
            line = ''
            i.each_with_index do |j,k|
                line += " #{j} #{'|'}" if k!=2
                line += " #{j}" if k==2
            end
            puts line
            puts '---|---|---'
        end
        puts ''
    end

    def update_board(position,cursor)
        invalid_position = %w[X O]
        if !invalid_position.include? @cells[position.to_i-1]
            @cells[position.to_i-1] = cursor
        else
            puts "That position #{position} is taken please enter another:"
        end
    end

end
