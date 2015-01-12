#RPG own repo


puts "What is your name?"

class Hero
  attr_accessor :name, :hit_points, :hit_chance

  def initialize(name, hit_points, hit_chance)
    @name = name
    @hit_points = hit_points
    @hit_chance = hit_chance
  end
end

new_name = gets.chomp.capitalize!

player = Hero.new(new_name, 10, 80)
puts player
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
end

villains = ["Trey", "JSON", "Tiffany", "Rachel", "David", "Andrew", "Will"]
random_baddie_hp = rand(1..8)
random_baddie_hit = rand(1..60)

baddie = Villain.new(villains.sample, random_baddie_hp, random_baddie_hit)
puts baddie
succesful_hero_hit = 0
succesful_villain_hit = 0

def fight(player, baddie)
  puts "#{player.name} attacks first!"

  while player.hit_points > 0 && baddie.hit_points > 0

    hero_hit = rand(0..100)
    baddie_hit = rand(0..100)

    if player.hit_points > 0
    if player.hit_chance  > hero_hit
      puts "succesful hit!"
      baddie.hit_points -= rand(2..4)
      puts "baddie is at #{baddie.hit_points}"
    else
      puts "you missed"
    end
  else
    puts "player dead"
  end

    if baddie.hit_points > 0
    if baddie.hit_chance > baddie_hit
      puts "baddie hits"
      player.hit_points -= rand(2..4)

      puts "you are at #{player.hit_points} life"
    else
      puts "baddie missed"
    end
  else
    puts "baddie dead"
  end
  end

end

def flee

end

fight_question = true

while fight_question == true
  puts "... will #{player.name} fight or flee?"
  fight_flee = gets.chomp.downcase
  puts player
  puts baddie
  if fight_flee == "fight"
    fight(player, baddie)
    fight_question = false
  elsif fight_flee == "flee"
    flee()
    fight_question = false
  end
end
