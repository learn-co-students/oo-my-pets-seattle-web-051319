require 'pry'

class Owner
  # code goes here

  attr_reader :species
  attr_accessor :name, :pets, :fish, :dog, :cat, :mood
  @@all = []
  

  def initialize(species)
    @species = species
    @@all << self
    @name = name
    @pets = {}
    @pets[:fishes] ||= []
    @pets[:dogs] ||= []
    @pets[:cats] ||= []
  end

  def say_species
    "I am a #{self.species}."
  end

  def pets
    @pets
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
    self.pets[:dogs].collect do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    self.pets[:cats].collect do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    self.pets[:fishes].collect do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    # binding.pry
    self.pets.collect do |type, pets|
      pets.collect do |pet|
        pet.mood = "nervous"
      end
      pets.clear
    end
  end 

  def list_pets
    num_of_fish = self.pets[:fishes].length
    num_of_dogs = self.pets[:dogs].length
    num_of_cats = self.pets[:cats].length
    "I have #{num_of_fish} fish, #{num_of_dogs} dog(s), and #{num_of_cats} cat(s)."
  end
  

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

end