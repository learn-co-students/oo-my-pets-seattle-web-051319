require 'pry'

class Owner
  attr_accessor :pets, :name
  attr_reader :species
  @@all = []

  def initialize(species)
    @species = species
    @pets = {fishes: [], cats: [], dogs: []}
    @@all << self
  end

  def self.all
    @@all
end

def self.count
  @@all.size
end

def self.reset_all
  @@all = []
end

def say_species
  if self
    "I am a human."
  end
end

def buy_fish(name)
  fish = Fish.new(name)
  self.pets[:fishes] << fish
end

def buy_cat(name)
  cat = Cat.new(name)
  self.pets[:cats] << cat
end

def buy_dog(name)
  dog = Dog.new(name)
  self.pets[:dogs] << dog
end

def walk_dogs
  self.pets[:dogs].each do |dog|
    dog.mood = "happy"
  end
end

def play_with_cats
  self.pets[:cats].each do |cat|
    cat.mood = "happy"
  end
end

def feed_fish
  self.pets[:fishes].each do |fish|
    fish.mood = "happy"
  end
end

def sell_pets
  @pets.each do |pets, info|
    info.each do |pet|
      pet.mood = "nervous"
    end
    info.clear #once the pets are sold, the owner know longer has information on the like their name or mood.
  end
end

def list_pets
  "I have #{@pets[:fishes].count} fish, #{@pets[:dogs].count} dog(s), and #{@pets[:cats].count} cat(s)."
end

end
