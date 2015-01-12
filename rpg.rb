#RPG own repo
puts "Welcome!"
puts "To begin our journey, enter your name:"

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

new_name = gets.chomp.capitalize!

player = Hero.new(new_name, 10, 80)
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
  attr_accessor :name, :hit_points, :hit_chance

  def initialize(name, hit_points, hit_chance)
    @name = name
    @hit_points = hit_points
    @hit_chance = hit_chance

  end
end # Villain constructor

sleep 0.75
puts "#{player.name} takes off after the villains!"

names = ["Giraud", "Joe", "Joel", "Trey", "JSON", "Tiffany", "Rachel", "Andrew", "Will", "Ricki", "Shosh", "Gen", "Sean", "Sam", "Crawford"]
shuffled = names.shuffle

def encounter(player, shuffled)
  villain = shuffled.delete_at(0)
  random_baddie_hp = rand(1..8)
  random_baddie_hit = rand(1..60)

  baddie = Villain.new(villain, random_baddie_hp, random_baddie_hit)

  def increase_difficulty(baddie)
    if baddie.name == "Sean" || baddie.name == "Sam" || baddie.name == "Crawford"
      # =~ /[Sean|Sam|Crawford]/ ask Sean about this

      baddie.hit_chance *= 2 # needs to be atleast 2 to be predictably hard
      baddie.hit_points *= 10

    end


  end # difficulty function

  increase_difficulty(baddie)

  puts "#{player.name} comes across #{baddie.name}. They appear to have #{baddie.hit_points} life and #{baddie.hit_chance} chance to hit"


  def fight(player, baddie)
    sleep 0.75
    puts "#{player.name} attacks first with #{player.max_hp} life"

    moves = ["karate chops", "kicks", "punches", "slaps"]

    while player.hit_points > 0 && baddie.hit_points > 0

      hero_hit = rand(0..100)
      baddie_hit = rand(0..100)

      if player.hit_points > 0
        if player.hit_chance  > hero_hit
          sleep 0.75
          puts "#{player.name} #{moves.sample} #{baddie.name}!"
          baddie.hit_points -= rand(2..4)
          puts "#{baddie.name} is at #{baddie.hit_points}"
        else
          sleep 0.75
          puts "#{player.name} swings and misses!"
        end
      else
        sleep 0.75
        puts "#{player.name} has been defeated!"

      end

      if baddie.hit_points > 0
        if baddie.hit_chance > baddie_hit
          puts "#{baddie.name} #{moves.sample} #{player.name}!"
          player.hit_points -= rand(1..3)

          puts "You are at #{player.hit_points} life"
        else
          puts "#{baddie.name} missed."
        end
      else
        player.encounters -= 1
        player.max_hp += 1
        puts "#{baddie.name} is defeated! #{player.name} is now at #{player.max_hp} life! #{player.encounters} more of these villains to go..."
      end
    end

  end # fight function

  def flee(player, baddie)
    sleep 0.75
    player.max_hp -= 2
    puts "#{player.name} flees from #{baddie.name}. #{player.encounters} still to go... but you have only #{player.max_hp} life!"
  end # flee function

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
  end # fight prompting

end # encounters

gameover = false
seppuku_chance = rand(1..100)

while player.encounters > 0 && player.hit_points > 0
  encounter(player, shuffled)
  if player.encounters <= 0
    puts "You've defeated the whole Peach clan!!!"
  end

  
  while player.hit_points <= 0 && gameover == false
    puts "You return to your dojo in shame... Your master asks you to commit seppuku..."
    if seppuku_chance < 50
      puts "You refuse and fail to regain your honor... tsk! Game Over!"
      gameover = true
    else
      puts "At least you didn't fail at this... Game over!"
      gameover = true
    end
  end
end # win & lose conditions
