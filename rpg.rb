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
  attr_accessor :name, :max_hp, :hit_points, :hit_chance, :encounters

  def initialize(name, max_hp, hit_chance)
    @name = name
    @max_hp = max_hp
    @hit_points = max_hp
    @hit_chance = hit_chance
    @encounters = 10
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
sleep 0.75
puts "#{player.name} enters the arena!"




def encounter(player)
  villains = ["Trey", "JSON", "Tiffany", "Rachel", "Andrew", "Will", "Ricki", "Shosh", "Gen", "Sean", "Sam", "Crawford"]
  
  random_baddie_hp = rand(1..8)
  random_baddie_hit = rand(1..60)
  
  baddie = Villain.new(villains.sample, random_baddie_hp, random_baddie_hit)
  def increase_difficulty(baddie)
  if baddie.name == "Sean" || baddie.name == "Sam" || baddie.name == "Crawford"
    
    baddie.hit_chance *= 2
    baddie.hit_points *= 5
  
  end

  increase_difficulty(baddie)
end # villain generator
  puts "you have encountered #{baddie.name}. They appear to have #{baddie.hit_points} life and #{baddie.hit_chance} chance to hit"


  def fight(player, baddie)
    sleep 0.75
    puts "#{player.name} attacks first with #{player.max_hp} life"

    while player.hit_points > 0 && baddie.hit_points > 0

      hero_hit = rand(0..100)
      baddie_hit = rand(0..100)

      if player.hit_points > 0
        if player.hit_chance  > hero_hit
          sleep 0.75
          puts "succesful hit!"
          baddie.hit_points -= rand(2..4)
          puts "#{baddie.name} is at #{baddie.hit_points}"
        else
          sleep 0.75
          puts "you missed"
        end
      else
        sleep 0.75
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
        player.encounters -= 1
        player.max_hp += 1
        puts "#{baddie.name} dead! #{player.name} is now at #{player.max_hp} life! #{player.encounters} more villains to go..."
      end
    end

  end #fight ends

  def flee(player, baddie)
    sleep 0.75
    player.max_hp -= 2
    puts "#{player.name} flees from #{baddie.name}. #{player.encounters} still to go... but you have only #{player.max_hp} life!"
  end

  fight_question = true

  while fight_question == true
    sleep 0.75
    puts "... will #{player.name} fight or flee?"
    fight_flee = gets.chomp.downcase
    if fight_flee == "fight"
      fight(player, baddie)
      fight_question = false
    elsif fight_flee == "flee"
      flee(player, baddie)
      fight_question = false
    end
  end

end

while player.encounters > 0 && player.hit_points > 0
  encounter(player)
  if player.encounters <= 0
    puts "You win!"
  end
  if player.hit_points <= 0
    puts "You're dead. Game over!"
  end
end
