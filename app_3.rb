require 'pry'
require_relative 'lib/game'
require_relative 'lib/player'

class App
    puts "THEY WANT TO F*** YOU UP !"
    puts "What is your name ?"
    print ">"
    name_of_the_player = gets.chomp
    my_game = Game.new(name_of_the_player)
    my_game.show_players
    puts " ------------ "
    while my_game.is_still_ongoing?
        my_game.menu
        my_game.enemies_attack
        puts " ------------ "
        if my_game.is_still_ongoing? then
        my_game.show_state
        end
    end
    my_game.end_credits
end