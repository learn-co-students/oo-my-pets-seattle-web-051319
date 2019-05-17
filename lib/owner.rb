require 'pry'
class Owner
  # code goes here
  attr_reader :species
  attr_accessor :pets, :name

  @@owner = []

  def initialize(name)
    @species = "human"
    @pets = {fishes: [], cats: [], dogs: []}
    @@owner << self
  end

  def self.all
    @@owner
  end

  def self.count
    @@owner.count
  end

  def self.reset_all
    @@owner.clear
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(name)
    fish = Fish.new(name)
    @pets[:fishes] << fish
  end

  def buy_dog(name)
    dog = Dog.new(name)
    @pets[:dogs] << dog
  end

  def buy_cat(name)
    cat = Cat.new(name)
    @pets[:cats] << cat
  end

  def walk_dogs
    @pets[:dogs].each {|dog| dog.mood = "happy"}
  end

  def play_with_cats
    @pets[:cats].each {|cat| cat.mood = "happy"}
  end

  def feed_fish
    @pets[:fishes].each {|fish| fish.mood = "happy"}
  end

  def sell_pets
    @pets.map do |species, pets|
      pets.each do |specific_pet|
        specific_pet.mood = "nervous"
      end
      pets.clear
    end
  end

  def list_pets
    "I have #{@pets[:fishes].count} fish, #{@pets[:dogs].count} dog(s), and #{@pets[:cats].count} cat(s)."
  end
end
