require 'pry'

#Je définis ma classe Player et je lui mets deux attributs @name et @life_points
class Player
	attr_accessor :name, :life_points

#Je définis ma première méthode initialize avec deux arguments et j'initialise les attributs de ma classe
	def initialize(player_name)
		@name = player_name.to_s
		@life_points = 10
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


class HumanPlayer < Player
#Ici je fais hériter les méthodes de ma classe mère Player à la class fille HumanPlayer
	attr_accessor :weapon_level
#Et je définis un nouvel attribut

	def initialize(player_name)
    super(player_name)
#J'utilise la méthode super vu que je rajoute un nouvel attribut mais que je n'ai pas envie de copier coller toute la méthode initialize de la classe Player
    @weapon_level = 1
    @life_points = 100  
  end

  def show_state
		puts "Tu as #{@life_points} points de vie et une arme de niveau #{@weapon_level}."
	end

	def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
  	new_weapon = rand(1..6)
  	if new_weapon > @weapon_level
  		puts "Youpi, c'est trop bien les gros guns puissants !!!"
  		@weapon_level = new_weapon
#Je récupère la valeur de ma nouvelle arme dans mon attribut weapon_level
  	else new_weapon <= @weapon_level
  		puts "C'est naze, tu restes avec ton couteau à beurre..."
		end
  end

  def search_health_pack
   rand_health = rand(1..6)
   if rand_health == 1
   	return "Tu n'a rien trouvé..."
   elsif rand_health > 2 && rand_health <= 5
    return "Bravo tu as trouve +50 pts de vie"
  	@life_points += 50
      if @life_points > 100
         @life_points == 100
      end
    else
    return "Waouh tu as trouvé un pack de +80 pts de vie"
      if @life_points > 100
         @life_points == 100
      end
  	end
	end

end

