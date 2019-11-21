#! /usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/board.rb'
require_relative '../lib/game.rb'
require_relative '../lib/player.rb'

def color(text,color="default")
    colors = {"default"=>"38","red"=>"31","green"=>"32","blue"=>"34"}
    color_code = colors[color]
    return "\033[#{color_code}m#{text}\033[0m"
end

def welcome
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

loop do
    
    players = []

    puts ''
    2.times do |i|
        print "#{color("Enter your name player #{i+1}: ","blue")}"
        players << gets.chomp
    end

    game = Game.new(players[0],players[1])

    puts ''
    puts "#{color("Welcome #{game.player1.name} & #{game.player2.name} Let's begin!","green")}"

    loop do
        game.switch_turn
        display_board(game.cells)

        position = ''
        loop do
            puts "#{color("#{game.current_player.name} your turn","green")}"
            print "Enter the grid location to place your marker: "

            position = gets.chomp

            break if game.is_valid?(position)
                
            puts "#{color("Invalid Position! Please choose a valid position.","red")}"
        end

        game.turn(position.to_i)
        game.board.moves = game.board.moves - 1

        break unless game.game_state == :active
    end

    display_board(game.cells)

    message = game.game_state == :winner ? "#{game.current_player.name} wins!" : "It's a Draw!"
    puts "#{color("#{message}","green")}"

    print "#{color("Would you like to play again?(y/n): ","green")}"
    selection = gets.chomp.downcase.to_s

    break unless selection.start_with?('y')
end
