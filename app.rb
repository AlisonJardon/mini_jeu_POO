		require 'pry'
		require 'bundler'
		Bundler.require

		require_relative 'lib/game'
		require_relative 'lib/player'

		player1 = Player.new("Pierrette")
		player2 = Player.new("Yolande")

		puts "Voici l'état de chaque joueuse :"

		while player1.life_points > 0 && player2.life_points >0
		 player1.show_state
		 player2.show_state
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
		  puts "Honneur à #{player2.name} !\n\n"
		  sleep 1
		 player2.attacks(player1)
		 sleep 1
		   break if player1.life_points <= 0
		  puts "\n#{player1.name} contre-attaque !\n\n"
		  sleep 1
		 	player1.attacks(player2)
		 	sleep 1
		end

		if player1.life_points > 0 && player2.life_points <= 0
			puts "\n#{player1.name} a gagné, CONGRATS !!!"
			sleep 1
		else
			puts "\n#{player2.name} a gagné, CONGRATS !!!"
			sleep 1
		end

		binding.pry