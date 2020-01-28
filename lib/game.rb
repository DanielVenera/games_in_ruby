require_relative 'player'

class Game < HumanPlayer
    attr_accessor :name, :enemies

    def initialize(name)
        enemy1 = Player.new("A")
        enemy2 = Player.new("B")
        enemy3 = Player.new("C")
        enemy4 = Player.new("D") 
        @enemies=[]
        @enemies << enemy1
        @enemies << enemy2
        @enemies << enemy3
        @enemies << enemy4
        super(name, weapon_level=1)
    end
    
    def kill_player(player)
        enemies.delete(player)      
    end
    
    def is_still_ongoing?
        if self.life_points <= 0 || enemies.size == 0 then
            false
        else
            true
        end   
    end

    def show_players
        puts self.show_state
        puts "There are your opponents : "
        enemies.each do |enemy| 
            enemy.show_state
        end
    end

    def menu
        puts "What do you want to do ?"
        a = 0
        enemies.each do |select_if_alive|
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
        if selected.to_i > 0 && selected.to_i <= enemies.size then
            self.attacks(enemies[selected.to_i-1])
                if enemies[selected.to_i-1].life_points <= 0 then
                    kill_player(enemies[selected.to_i-1])
            else
                enemies[selected.to_i-1].show_state
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
        enemies.each do |attack|
            attack.attacks(self)
        end
    end

    def end_credits
        if self.life_points <= 0 then
            puts "You died"
            puts "You lose"
        end
        if enemies.size == 0 then
            puts "You defeated all your opponents !"
            puts "You won !"
        end
    end
end