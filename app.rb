require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")
while player1.life_points >= 1 && player2.life_points >= 1
    puts "\nThere is the state of our fighters :"
    player1.show_state
    player2.show_state
    puts "\nRumble !!!"
    player1.attacks(player2)
    if player2.life_points >= 1
        player2.attacks(player1)
    else 
        break
    end
end