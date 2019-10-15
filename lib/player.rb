require 'pry'

#Je définis ma classe Player et je lui mets deux attributs @name et @life_points
class Player
	attr_accessor :name, :life_points

#Je définis ma première méthode initialize avec deux arguments et j'initialise les attributs de ma classe
	def initialize(player_name, state_of_life = 10)
		@name = player_name.to_s
		@life_points = state_of_life
	end

#Je définis ma méthode show_state qui va appeler mes deux attributs
	def show_state
		puts "#{@name} dispose actuellement de #{@life_points} points de vie."
	end

#Je définis ma méthode gets_damage avec une variable damages qui est un entier. 
# J'y instaure une méthode if avec une condition qui va me permettre d'indiquer soit le nombre de points de vie restant, 
# soit un game over si le player n'a plus de points de vie.
	def gets_damage(damages)
		@life_points = @life_points - damages
		if @life_points <= 0
			puts "FATALITY ! #{@name} est vaincue !"
		else
			puts "#{@name} a #{@life_points} points de vie !"
		end
	end

#Je définis ma méthode attacks à laquelle je rattache une variable player_attacked 
	def attacks(player_attacked)
		puts "#{@name} attaque #{player_attacked.name}"
#Ici j'appelle mon attribut name qui correspond au joueur qui attaque et j'appelle l'attribut name pour la variable player_attacked pour le joueur qui sera attaqué
		damages = compute_damage
#Ici j'appelle ma méthode compute_damage dans une variable damages qui va me permettre d'afficher le nombre de dégats subis
		puts "Elle lui inflige #{damages} points de dégâts !"
		player_attacked.gets_damage(damages)
#Enfin j'applique ma méthode gets_damage à mon objet player_attacked
	end

	def compute_damage
    return rand(1..6)
  end

end