class Player
    attr_accessor :name, :life_points

    def initialize(name, life_points = 10)
    @name = name
    @life_points = life_points
    end

    def show_state
        puts "#{@name} has #{@life_points} life points"
    end

    def gets_damage(a)
        @life_points = @life_points - a
        if @life_points <= 0
            puts "\n#{@name} is dead !"
        end
    end

    def attacks(player)
        puts "#{@name} attacks #{player.name} !"
        a = compute_damage
        puts "#{@name} inflicts #{a} damage to #{player.name}"
        player.gets_damage(a)
    end
    def compute_damage
        return rand(1..6)
    end
end

class HumanPlayer < Player
    attr_accessor :weapon_level

    def initialize(name, weapon_level=1)
        @weapon_level = weapon_level
        super(name, life_points = 100)
    end

    def show_state
        puts "You have #{self.life_points} life points and a weapon of level #{self.weapon_level}"
    end

    def compute_damage
        rand(1..6) * @weapon_level
    end

    def search_weapon
        a = rand(1..6)
        puts "You've reached a weapon of level #{a}"
        if a > @weapon_level then
            puts "Great ! This is your new weapon"
            @weapon_level = a
        else
            puts "F*** ! This weapon is worthless"
        end
    end

    def search_health_pack
        a = rand(1..6)
        if a == 1 then
            puts "You've reached no health pack"
        end
        if a >= 2 && a <= 5 then
            puts "Great ! You've reached a 50 life points health pack"
            @life_points = @life_points + 50
            if @life_points > 99 then 
                @life_points = @life_points - (@life_points-100)
                puts "You have now 100 life points. That's lit !"
            else 
            puts "You have now #{self.life_points} life points !"
            end
        end
        if a == 6 then
            puts "WOW ! You've reached a 80 life points health pack"
            @life_points = @life_points + 80
            if @life_points > 99 then 
                @life_points = @life_points - (@life_points-100)
                puts "You have now 100 life points. That's lit !"
            else 
            puts "You have now #{self.life_points} life points !"
            end
        end
    end
end

