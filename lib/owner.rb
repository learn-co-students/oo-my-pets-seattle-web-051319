require "pry"
class Owner
  attr_reader :species 
  attr_accessor :name, :pets

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @pets = {:fishes => [], :dogs => [], :cats => []}
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def say_species 
    "I am a #{@species}."
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
    dog = Dog.new(name)
    @pets[:dogs] << dog
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
    @pets.each do |pet_type, pets|
      pets.each do |pet|
        pet.mood = "nervous"
      end
      pets.clear
    end
  end

  def list_pets
    decl = "I have "
    @pets.each do |pet_type, pets|
      # binding.pry
      if pet_type == :fishes
        decl += "#{pets.count} fish, "
      elsif pet_type == :dogs
        decl += "#{pets.count} dog(s), "
      else 
        decl += "and #{pets.count} cat(s)."
      end
    end
    decl
  end
end


