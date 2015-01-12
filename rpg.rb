#RPG own repo
lines = ["After another long day of hauling water you've returned to the dojo...",
"'What's this?!' You find your master is taking his last breaths..",
"'Avenge me...'",
"You realize this could only be the work of your rival clan...",
"They must pay... ALL 100 of them!"]

lines.each {|each| 
  puts each 
  sleep 0.5}

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


new_name = gets.chomp.capitalize!

player = Hero.new(new_name, 10, 80)
sleep 1
puts "#{player.name} enters the arena!"


encounter_count = 2

def encounter(player, encounter_count)
  villains = ["Trey", "JSON", "Tiffany", "Rachel", "David", "Andrew", "Will"]
  random_baddie_hp = rand(1..8)
  random_baddie_hit = rand(1..60)

  baddie = Villain.new(villains.sample, random_baddie_hp, random_baddie_hit)
  puts "you have encountered #{baddie.name}. They appear to have #{baddie.hit_points} life and #{baddie.hit_chance} chance to hit"


  def fight(player, baddie, encounter_count)
    sleep 1
    puts "#{player.name} attacks first with #{player.max_hp} life"

    while player.hit_points > 0 && baddie.hit_points > 0

      hero_hit = rand(0..100)
      baddie_hit = rand(0..100)

      if player.hit_points > 0
        if player.hit_chance  > hero_hit
          sleep 1
          puts "succesful hit!"
          baddie.hit_points -= rand(2..4)
          puts "#{baddie.name} is at #{baddie.hit_points}"
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
          puts "#{baddie.name} hits"
          player.hit_points -= rand(1..3)

          puts "you are at #{player.hit_points} life"
        else
          puts "#{baddie.name} missed."
        end
      else
        encounter_count -= 1
        player.max_hp += 1
        puts "#{baddie.name} dead! #{player.name} is now at #{player.max_hp} life! #{encounter_count} more villains to go..."
      end
    end

  end #fight ends

  def flee(player, baddie, encounter_count)
    sleep 1
    player.max_hp -= 2
    puts "#{player.name} flees from #{baddie.name}. #{encounter_count} still to go... but you have only #{player.max_hp} life!"
  end

  fight_question = true

  while fight_question == true
    sleep 1
    puts "... will #{player.name} fight or flee?"
    fight_flee = gets.chomp.downcase
    if fight_flee == "fight"
      fight(player, baddie, encounter_count)
      fight_question = false
    elsif fight_flee == "flee"
      flee(player, baddie, encounter_count)
      fight_question = false
    end
  end

end

while player.hit_points > 0
  encounter(player, encounter_count)
  if encounter_count == 0
    puts "You win!"
  end
  if player.hit_points <= 0
    puts "You're dead. Game over!"
  end
end
