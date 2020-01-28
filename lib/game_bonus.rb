require_relative 'player'

class Game < HumanPlayer
    attr_accessor :name, :players_left, :enemies_in_sight, :kills

    def initialize(name, players_left = 10, kills = 0) 
        @enemies_in_sight=[]
        @players_left = players_left
        @kills = kills
        super(name, weapon_level=1)
    end
    
    def kill_player(player)
        enemies_in_sight.delete(player)
        @kills = @kills + 1
    end
    
    def is_still_ongoing?
        if self.life_points > 0 then
            true
        else
            false
        end   
    end

    def new_players_in_sight
        if enemies_in_sight.size == 10 then
            puts "All players are still in game"
        else
            a = rand(1..6)
            if a == 1 then
                puts "0 players coming"
            end
            if a >= 2 && a <= 4 then
                b = Player.new("joueur_#{rand(1..9999)}")
                enemies_in_sight << b
                puts "#{b.name} is coming !"
            end
            if a == 5 || a == 6 then
                c = Player.new("joueur_#{rand(1..9999)}")
                enemies_in_sight << c
                puts "#{c.name} is coming !"
                d = Player.new("joueur_#{rand(1..9999)}")
                enemies_in_sight << d
                puts "#{d.name} is coming !"
            end
        end
    end

    def show_players
        puts self.show_state
        puts "There are your opponents : "
        enemies_in_sight.each do |enemy| 
            enemy.show_state
        end
    end

    def menu
        puts "What do you want to do ?"
        a = 0
        enemies_in_sight.each do |select_if_alive|
            a += 1
            puts "#{a} - Attack #{select_if_alive.name}"
            puts select_if_alive.show_state
        end
        puts "w - Search for a better Weapon ?"
        puts "h - Search for a Health pack ?"
        print ">"
        selected = gets.chomp
        self.menu_choice(selected)
    end

    def menu_choice(selected)
        if selected.to_i > 0 && selected.to_i <= enemies_in_sight.size then
            self.attacks(enemies_in_sight[selected.to_i-1])
                if enemies_in_sight[selected.to_i-1].life_points <= 0 then
                    kill_player(enemies_in_sight[selected.to_i-1])
            else
                enemies_in_sight[selected.to_i-1].show_state
            end
        end

        if selected == "w" then
            self.search_weapon
        end

        if selected == "h" then
            self.search_health_pack
        end
        
    end

    def enemies_attack
        enemies_in_sight.each do |attack|
            if self.life_points > 0 then
                attack.attacks(self)
            end
        end 
    end

    def end_credits
        if self.life_points <= 0 then
            puts "GAME OVER"
            puts "You have killed #{@kills} opponents"
        end
    end
end