#RPG own repo


puts "What is your name?"

class Hero
  attr_accessor :name, :max_hp, :hit_points, :hit_chance

  def initialize(name, max_hp, hit_chance)
    @name = name
    @max_hp = max_hp
    @hit_points = max_hp
    @hit_chance = hit_chance
  end
end # Hero constructor

new_name = gets.chomp.capitalize!

player = Hero.new(new_name, 10, 80)
sleep 1
puts "#{player.name} enters the forest!"
puts "Hi #{player.name}! Prepare for battle!"


class Villain
  attr_accessor :name, :hit_points, :hit_chance

  def initialize(name, hit_points, hit_chance)
    @name = name
    @hit_points = hit_points
    @hit_chance = hit_chance
    # @strength = 4
    # @defense = 4
  end
end # Villain constructor

def encounter(player)
villains = ["Trey", "JSON", "Tiffany", "Rachel", "David", "Andrew", "Will"]
random_baddie_hp = rand(1..8)
random_baddie_hit = rand(1..60)

baddie = Villain.new(villains.sample, random_baddie_hp, random_baddie_hit)
puts "you have encountered #{baddie.name}. They appear to have #{baddie.hit_points} life and #{baddie.hit_chance} chance to hit"

def fight(player, baddie)
  sleep 1
  puts "#{player.name} attacks first!"

  while player.hit_points > 0 && baddie.hit_points > 0
    sleep 1
    puts "#{player.name} enters with #{player.max_hp} life"
    
    hero_hit = rand(0..100)
    baddie_hit = rand(0..100)

    if player.hit_points > 0
    if player.hit_chance  > hero_hit
      sleep 1
      puts "succesful hit!"
      baddie.hit_points -= rand(2..4)
      puts "baddie is at #{baddie.hit_points}"
    else
      sleep 1
      puts "you missed"
    end
  else
    sleep 1
    puts "player dead"

  end

    if baddie.hit_points > 0
    if baddie.hit_chance > baddie_hit
      puts "baddie hits"
      player.hit_points -= rand(1..3)

      puts "you are at #{player.hit_points} life"
    else
      puts "baddie missed."
    end
  else
    
    player.max_hp += 1
    puts "baddie dead! #{player.name} is now at #{player.max_hp} life!"
  end
  end

end #fight ends

def flee(player, baddie)
  sleep 1
  puts "#{player.name} flees from #{baddie.name}."
end

fight_question = true

while fight_question == true
  sleep 1
  puts "... will #{player.name} fight or flee?"
  fight_flee = gets.chomp.downcase
  puts player
  puts baddie
  if fight_flee == "fight"
    fight(player, baddie)
    fight_question = false
  elsif fight_flee == "flee"
    flee(player, baddie)
    fight_question = false
  end
end
end


encounter(player)




