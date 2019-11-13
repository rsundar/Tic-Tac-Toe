#! /usr/bin/env ruby
# frozen_string_literal: true

game_count = 0
$cells = [1,2,3,4,5,6,7,8,9]
#def gameStart
#end

def color(text,color="default")
    colors = {"default"=>"38","red"=>"31","green"=>"32","blue"=>"34"}
    color_code = colors[color]
    return "\033[#{color_code}m#{text}\033[0m"
end

def self.welcome
    puts " #{color("Welcome to the tic-tac-toe game!.
    1. The game is played on a grid that's 3 squares by 3 squares.
    2. Player 1 is X and Player 2 is O.
    3. Players take turns putting their marks in the numbered squares.
    4. The first player to get 3 in a row wins.
    5. When all 9 squares are full, the game is a draw. If no player has 3 in a row.","green")} "
end
welcome

def display_board(n)
    array = n.each_slice(3).to_a
    puts ''
    puts "#{color("---|---|---","blue")}"
    array.each do |i|
        line = ''
        i.each_with_index do |j,k|
            line += " #{j} #{'|'}" if k!=2
            line += " #{j}" if k==2
        end
        puts "#{color("#{line}","blue")}"
        puts "#{color("---|---|---","blue")}"
    end
    puts ''
end

def update_board(position,cursor)
    $cells[position.to_i-1] = cursor
end

def valid_position?(position)
    invalid = %w[X O]
    return !invalid.include?($cells[position.to_i-1]) && (1...10).include?(position.to_i)
end

display_board($cells)

5.times do
    puts "Enter a new position:"
    new_position = gets.chomp

    if valid_position?(new_position)
        update_board(new_position,'X')
    else
        puts "Invalid input!"
    end

    display_board($cells)
end