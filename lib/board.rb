class Board
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
        @cells[position.to_i-1] = cursor
    end

    def valid_position?(position)
        invalid = %w[X O]
        return !invalid.include?($cells[position.to_i-1]) && (1...10).include?(position.to_i)
    end
end
