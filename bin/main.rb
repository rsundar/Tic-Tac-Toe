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

#I will create the board object in milestone 3
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
        return name unless name.empty?
        puts "Please do not leave this field empty"
        name = gets.chomp!
    end
end

def valid_element?(element)
    loop do
        valid = %w[X O]
        return element if valid.include? element
        puts "Please Enter X or O in upper case or lower case."
        element = gets.chomp.upcase!
    end
end

def valid_coordinate?(element)
    loop do
        valid = %w[0 1 2 3 4 5 6 7 8]
        return element if valid.include? element
        puts "Please enter a valid number (between 0 and 8)"
        element = gets.chomp!
    end
end

puts "Player 1 please enter your name:"
player1 = name_valid?(gets.chomp!)
puts "Player 2 please enter your name:"
player2 = name_valid?(gets.chomp!)
puts "Player 1 choose your symbol:"
player1_x = valid_element?(gets.chomp.upcase!)
player2_x = player1_x == 'X'? 'O' : 'X' 

# We will ask the user to enter a grid co ordinate between 1 and 9 and display the 
# board/game state and request player 2 to enter the same and continue until the end of
# the game (which happens when a player wins or all the cells are filled and no one has won).
game_on = true
game_won = false
num_of_turns = 9
#Primary game loop
while game_on 
    #loop through the turns until the game is won or 9 turns have been exhausted.
    puts "#{player1} your turn, please enter the grid location (between 0 and 8):"
    grid = valid_coordinate?(gets.chomp!)

    puts "#{player2} your turn, please enter the grid location (between 0 and 8):"
    grid = valid_coordinate?(gets.chomp!)

    if game_won || num_of_turns == 0
        game_on = false
    end
    
    num_of_turns = num_of_turns - 1
end