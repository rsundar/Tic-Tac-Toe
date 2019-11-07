#! /usr/bin/env ruby

#frozen_string_literal: true

def welcome
    puts " Welcome to the tic-tac-toe game!.
    1. The game is played on a grid that's 3 squares by 3 squares.
    2. You are X or O, your friend is O or X.
    3. Players take turns putting their marks in empty squares.
    4. The first player to get 3 in a row wins.
    5. When all 9 squares are full, the game is over. If no player has 3."
end
welcome

def show_board(cell)
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

def name_valid?(name)
    loop do
        valid = name.empty?
        return name unless valid
    end
end

def valid_element?(element)
    loop do
        valid = %w[X O]
        return element if element.include? valid
        puts "Please Enter X or O in upper case or lower case."
        element = gets.chomp.upcase!
    end
end

# We will ask the user to enter a grid co ordinate between 1 and 9 and display the 
# board/game state and request player 2 to enter the same and continue until the end of
# the game (which happens when a player wins or all the cells are filled and no one has won).

board = 
game_on =true
num_of_turns = 9
#Primary game loop
while game_on
    #loop through the turns until the game is won or 9 turns have been exhausted.
    puts "Enter Co-ordinate: "
    input = gets.chomp

    if game_won || num_of_turns == 0
        game_on = false
    end 
end