#advRpg.rb
puts "Welcome!"
puts "To begin our journey, enter your name:"

class Hero
  attr_accessor :name, :max_hp, :hit_points, :hit_chance, :str, :defense, :encounters

  def initialize(name, max_hp, str, defense)
    @name = name
    @max_hp = max_hp
    @hit_points = max_hp
    # @hit_chance = hit_chance
    @str = str
    @defense = defense
    @encounters = 0
  end
end # Hero constructor

new_name = gets.chomp.capitalize!

player = Hero.new(new_name, 10, 80, 5, 5)
# puts "#{player.name}"

lines = ["After another long day of training outside you've returned to the dojo...",
         "'What's this?!' You find your fellow students tending to your master..",
         "Defeated and shamed, he looks towards his prized pupil... 'Avenge me #{player.name}...'",
         "You realize this could only be the work of the Peach clan...",
         "They must pay... ALL of them!"]

lines.each {|each|
  puts each
sleep 0.5}

class Villain
  attr_accessor :name, :hit_points, :hit_chance, :str, :defense

  def initialize(name, hit_points, hit_chance, str, defense)
    @name = name
    @hit_points = hit_points
    @hit_chance = hit_chance
    @str = str
    @defense = defense

  end
end # Villain constructor

sleep 0.75
puts "#{player.name} takes off after the villains!"

names = ["Noel", "Ciara", "Alvin", "Jerome", "Tyler", "Kyle", "Katrina", "Marc", "Adam", "David", "Sean", "Gabriel", "Lauren", "Giraud", "Joe", "Joel", "Trey", "JSON", "Tiffany", "Rachel", "Andrew", "Will", "Ricki", "Shosh", "Gen", "Master Sean", "Crane Master Sam", "Drunken Master Crawford"]
shuffled = names.shuffle

def encounter(player, shuffled)
  villain = shuffled.delete_at(0)
  random_baddie_hp = rand(1..8)
  # random_baddie_hit = rand(1..60)

  baddie = Villain.new(villain, random_baddie_hp, 90, 4, 4)

  def increase_difficulty(baddie)

    baddie.hit_points += 1
    baddie.str += 1
    baddie.defense += 1


  end # difficulty function

  def level_up_check(player, baddie)
  	if player.encounters % 3 == 0 && player.encounters > 1 
  		puts "Congrats! You've leveled up. You get 1 skill point. Do you want str or defense?"
  			skill_choice = gets.chomp.downcase
  			if skill_choice == "str"
  				player.str += 1
  			elsif skill_choice == "defense"
  				player.defense += 1
  			end
  			increase_difficulty(baddie)
  		end
  end


  puts "#{player.name} comes across #{baddie.name}. They appear to have #{baddie.hit_points} health, #{baddie.str} strength, #{baddie.defense} defense and #{baddie.hit_chance} chance to hit"


  def fight(player, baddie)
    sleep 0.75
    puts "#{player.name} attacks first with #{player.max_hp} health."

    moves = ["karate chops", "kicks", "punches", "slaps"]

    while player.hit_points > 0 && baddie.hit_points > 0

      hero_hit = rand(1..player.str)

      hero_block = rand(1..player.defense)
      baddie_hit = rand(1..baddie.str)
      baddie_block = rand(1..baddie.defense)

      if player.hit_points > 0
        if player.hit_chance  > hero_hit
          sleep 0.75
          puts "#{player.name} #{moves.sample} #{baddie.name}!"
          successful_hit = true
          baddie.hit_points -= rand(2..4)
          puts "#{baddie.name} is at #{baddie.hit_points} health."
        else
          sleep 0.75
          puts "#{player.name} swings and misses!"
        end

      end

      if baddie.hit_points > 0
        if baddie.hit_chance > baddie_hit
          puts "#{baddie.name} #{moves.sample} #{player.name}!"
          player.hit_points -= rand(1..3)

          puts "You are at #{player.hit_points} health."
        else
          puts "#{baddie.name} swings hard but you dodge!"
        end
      else
        player.encounters += 1
        player.max_hp += 1
        puts "#{baddie.name} is defeated! #{player.name} is now at #{player.max_hp} health! #{player.encounters} more of these villains to go..."
        level_up_check(player, baddie)
      end
    end

  end # fight function

  def flee(player, baddie)
    sleep 0.75
    player.max_hp -= 2
    puts "#{player.name} flees from #{baddie.name}. #{player.encounters} still to go... but you have only #{player.max_hp} health!"
  end # flee function

  fight_question = true

  while fight_question == true
    puts "... will #{player.name} fight or flee?"
    fight_flee = gets.chomp.downcase
    if fight_flee == "fight"
      fight(player, baddie)
      fight_question = false
    elsif fight_flee == "flee"
      flee(player, baddie)
      fight_question = false
    end

  end # fight prompting
  
  

end # encounters

gameover = false
seppuku_chance = rand(1..100)

while player.encounters < 100 && player.hit_points > 0
  encounter(player, shuffled)
  if player.encounters >= 100
    puts "You've defeated the whole Peach clan!!!"
  end


  while player.hit_points <= 0 && gameover == false
    puts "You return to your dojo in shame... Your master asks you to commit seppuku..."
    if seppuku_chance < 50
      puts "#{player.name}: This is Kung Fu not feudal Japan... tsk!"
      sleep 2
      puts "Your master demonstrates the infamous Five Point Palm Exploding Heart Technique... Game Over!"
      gameover = true
    else
      puts "At least you don't fail at everything... Game over!"
      gameover = true
    end
  end
end # win & lose conditions
