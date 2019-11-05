module Display
    def self.welcome
        puts " Welcome to the tic-tac-toe game!.
        1. The game is played on a grid that's 3 squares by 3 squares.
        2. You are X or O, your friend is O or X.
        3. Players take turns putting their marks in empty squares.
        4. The first player to get 3 in a row wins.
        5. When all 9 squares are full, the game is over. If no player has 3.".green
    end

    def self.show_board(cell)
        puts ''
        puts '---+---+---'
        cell.each do |i|
            line = ''
            i.each_with_index do |j,k|
                line += "#{j} #{'|'}" if k!=2
                line += "#{j}" if k==2
            end
            puts line
            puts '---+---+---'
        end
        puts ''
    end

    
end