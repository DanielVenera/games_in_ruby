require 'pry'
require_relative 'lib/game'
require_relative 'lib/player'

class App
    puts "THEY WANT TO F*** YOU UP !"
    puts "What is your name ?"
    print ">"
    name = gets.chomp
    user = HumanPlayer.new(name)
    puts "#{user.name} !" #little call before the fight
    enemies = []
    enemy1 = Player.new("Josiane")
    enemy2 = Player.new("José")
    enemies << enemy1
    enemies << enemy2
    puts "You have #{enemies.size} enemies coming at you !"
    puts "#{enemy1.name} and #{enemy2.name}"
    puts " ------------ "
    while user.life_points >0 && (enemy1.life_points > 0 || enemy2.life_points >0)
        puts user.show_state
        puts "What do you want to do ? Press the selected key"
            if  enemy1.life_points > 0 then
                puts "1 - Attack #{enemy1.name}."
                puts enemy1.show_state
            end
            if enemy2.life_points > 0 then 
                puts "2 - Attack #{enemy2.name}." 
                puts enemy2.show_state
            end
        puts "w - Search for a better Weapon ?"
        puts "h - Search for a Health pack ?"
        print ">"
        selection = gets.chomp
        if selection == "1" then
            user.attacks(enemy1)
            if enemy1.life_points <= 0 then
                enemies.delete(enemy1)
            else
                enemy1.show_state
            end
        end
        if selection == "2" then
            user.attacks(enemy2)
            if enemy2.life_points <= 0 then
                enemies.delete(enemy2)
            else
                enemy2.show_state
            end
        end
        if selection == "w" then
            user.search_weapon
        end
        if selection == "h" then
            user.search_health_pack
        end

        if enemies.size == 0 then 
            puts "YOU WIN PERFECT !"
            break
        end
        puts "The enemies attack you !"
        enemies.each do |enemy_attack|
            enemy_attack.attacks(user)
            if user.life_points <= 0 then
                puts "You lose"
                break
            end
        end
    puts " ------------ "
    end
end