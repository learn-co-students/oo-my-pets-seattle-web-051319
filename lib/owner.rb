class Owner
  attr_reader :species
  attr_accessor :name, :pets 

  @@all = []

  def initialize(name)
    @pets = {:fishes => [], :dogs => [], :cats => []}
    @name
    @species = "human"
    @@all << self
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end

  def say_species
    "I am a #{@species}."
  end

  def self.count
    @@all.count
  end

  def buy_fish(name)
    fish = Fish.new(name)
    @pets[:fishes] << fish
  end

  def buy_cat(name)
    cat = Cat.new(name)
    @pets[:cats] << cat
  end

  def buy_dog(name)
    cat = Dog.new(name)
    @pets[:dogs] << cat
  end

  def walk_dogs
    @pets[:dogs].each do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    @pets[:cats].each do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    self.pets[:fishes].each do |fish|
      fish.mood = "happy"
    end
  end
  
  def sell_pets
    @pets.each do |pets, sell|
      sell.each do |pet|
        pet.mood = "nervous"
    end
    sell.clear
  end
end
  
  def list_pets
    "I have #{@pets[:fishes].count} fish, #{@pets[:dogs].count} dog(s), and #{@pets[:cats].count} cat(s)."
  end
  

end