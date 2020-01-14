class Owner
  attr_reader :name, :species

  def initialize name
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat name
    Cat.new(name, self)
  end

  def buy_dog name
    Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.select do |dog|
      dog.mood = "happy" if dog.owner == self
    end
  end

  def feed_cats
    Cat.all.select do |cat|
      cat.mood = "happy" if cat.owner == self
    end
  end

  def sell_pets
    self.dogs.each do |dog|
      dog.owner = nil
      dog.mood = "nervous"
    end

    self.cats.each do |cat|
      cat.owner = nil
      cat.mood = "nervous"
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

  @@all = []

  def self.all
    @@all
  end

  def self.count
    all.count
  end

  def self.reset_all
    @@all = []
  end
end