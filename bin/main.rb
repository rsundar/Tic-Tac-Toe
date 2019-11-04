puts "Welcome to Tic Tac Toe!"
puts "-----------------------"

puts "Play a game with (1) Computer, (2) Your Friend:"
game_mode = gets.chomp

puts "You selected #{game_mode}"

if game_mode == 1
    puts "Sorry AGI has not been invented yet, check back in 2020!"
elsif game_mode == 2
    puts "Enter the name of Player 1:"
    player1 = gets.chomp

    puts "Enter the name of Player 2:"
    player2 = gets.chomp
else
    puts "Please select (1) or (2)"
end

puts "Select (X) or (O)"
x_or_o = gets.chomp

if (x_or_o != 'x' || x_or_o !='X' || x_or_o != 'o' || x_or_o != 'O')
    puts "Please select (X) or (O)"
    x_or_o = gets.chomp
end

# We will ask the user to enter a grid co ordinate between 1 and 9 and display the 
# board/game state and request player 2 to enter the same and continue until the end of
# the game (which happens when a player wins or all the cells are filled and no one has won).

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