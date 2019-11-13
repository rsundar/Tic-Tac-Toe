#! /usr/bin/env ruby
# frozen_string_literal: true

game_count = 0
$cells = [1,2,3,4,5,6,7,8,9]
#def gameStart
#end

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
    if !invalid_position.include? $cells[position.to_i-1]
        $cells[position.to_i-1] = cursor
    else
        puts "That position #{position} is taken please enter another:"
    end
end

display_board($cells)

puts "Enter a new position:"
new_position = gets.chomp

update_board(new_position,'X')
display_board($cells)