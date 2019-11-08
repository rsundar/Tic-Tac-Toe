puts "Welcome to Tic Tac Toe!"
puts "-----------------------"

puts "Play a game with (1) Computer, (2) Your Friend:"
game_mode = gets.chomp.upcase!

puts "You selected #{game_mode}"

puts "Select (X) or (O)"
x_or_o = gets.chomp

if (x_or_o != 'x' || x_or_o !='X' || x_or_o != 'o' || x_or_o != 'O')
    puts "Please select (X) or (O)"
    x_or_o = gets.chomp
end

# Main Game Loop, for now we countdown from 10 to 0 to test user interactivity
# We will ask the user to enter a grid co ordinate between 1 and 9 and display the 
# board/game state and request player 2 to enter the same and continue until the end of
# the game (which happens when a player wins or all the cells are filled and no one has won).

i = 10

i.times do
    puts "Enter Co-ordinate: "
    input = gets.chomp
end