require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Pierrette")
player2 = Player.new("Yolande")

puts "------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------"
puts "Quel est ton nom :"
print "> "

human_player_name = gets.chomp
user = HumanPlayer.new(human_player_name)

puts "Voici ton équipement de base :"
sleep 1
user.show_state
sleep 1
puts "Le jeu va commencer #{user.name}, prépare toi !"
sleep 1
puts "..."
sleep 1
puts "..."
sleep 1
puts "..."
sleep 1
puts '

  ______   _____    _____   _    _   _______     _ 
 |  ____| |_   _|  / ____| | |  | | |__   __|   | |
 | |__      | |   | |  __  | |__| |    | |      | |
 |  __|     | |   | | |_ | |  __  |    | |      | |
 | |       _| |_  | |__| | | |  | |    | |      |_|
 |_|      |_____|  \_____| |_|  |_|    |_|      (_)
                                                   
                                                   

'
sleep 1

