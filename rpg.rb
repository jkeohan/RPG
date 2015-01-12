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
  puts "#{player.name} attacks!"

  living = true

  succesful_hero_hit = 0
  succesful_villain_hit = 0

  while living
    hero_hit = rand(0..100)
    baddie_hit = rand(0..100)
    if  rand(1..100) <= 80
      succesful_hero_hit+1

    end

    if rand(1..100) <= 60
      succesful_villain_hit+1
    end

    puts player.hit_points

    if player.hit_points < 0
      puts  "#{player.name} has fallen in battle!"
      living = false
    end

    if baddie.hit_points < 0
      puts "#{player.name} has defeated evil today!"
      living = false
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

