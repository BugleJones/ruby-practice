# Self
# Use self when calling setter methods from within the class. 
# In our earlier example we showed that self was necessary in order 
# for our change_info method to work properly. We had to use self 
# to allow Ruby to disambiguate between initializing a local variable 
# and calling a setter method.
# OR Use self for class method definitions.

#Class Variables

class GoodDog
    @@number_of_dogs = 0
  
    def initialize
      @@number_of_dogs += 1
    end
  
    def self.total_number_of_dogs
      @@number_of_dogs
    end
  end
  
  puts GoodDog.total_number_of_dogs   # => 0
  
  dog1 = GoodDog.new
  dog2 = GoodDog.new
  
  puts GoodDog.total_number_of_dogs   # => 2

  #Constants

  class GoodDog
    DOG_YEARS = 7
  
    attr_accessor :name, :age
  
    def initialize(n, a)
      self.name = n
      self.age  = a * DOG_YEARS
    end
  end
  
  sparky = GoodDog.new("Sparky", 4)
  puts sparky.age             # => 28

  #With to_s

  class GoodDog
    DOG_YEARS = 7
  
    attr_accessor :name, :age
  
    def initialize(n, a)
      @name = n
      @age  = a * DOG_YEARS
    end
  
    def to_s
      "This dog's name is #{name} and it is #{age} in dog years."
    end
  end

  #p spark to use inspect for debugging == puts [variablename].inspect



