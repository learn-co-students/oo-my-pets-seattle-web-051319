class Owner
	attr_accessor :name, :pets
	attr_reader :species
	
	@@all = []
	
	def initialize(name)
		@name = name
		@species = "human"
		@pets = {:cats => [], :dogs => [], :fishes => []}
		@@all.push(self)
	end	
	
	def self.all
		@@all
	end
	
	def self.count
		self.all.count
	end
	
	def self.reset_all
		self.all.clear
	end
	
	def say_species
		"I am a #{@species}."
	end
	
	def buy_fish(name)
		fish = Fish.new(name)
		self.pets[:fishes].push(fish)
	end
	
	def buy_cat(name)
		cat = Cat.new(name)
		self.pets[:cats].push(cat)
	end
	
	def buy_dog(name)
		dog = Dog.new(name)
		self.pets[:dogs].push(dog)
	end
	
	def walk_dogs
		self.pets[:dogs].each {|dog| dog.mood = "happy"}
	end
	
	def play_with_cats
		self.pets[:cats].each {|cat| cat.mood = "happy"}
	end
	
	def feed_fish
		self.pets[:fishes].each {|fish| fish.mood = "happy"}
	end
	
	def sell_pets
		pets.each do |species, pet|
			pet.each {|animal| animal.mood = "nervous"}
			pet.clear
		end	
	end
	
	def list_pets
		cat_count = @pets[:cats].size
		dog_count = @pets[:dogs].size
		fish_count = @pets[:fishes].size
		"I have #{fish_count} fish, #{dog_count} dog(s), and #{cat_count} cat(s)."
	end
end