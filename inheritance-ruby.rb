# Modules and inheritance
# If it's an "is-a" relationship, choose class inheritance. 
# If it's a "has-a" relationship, choose modules. 
# Example: a dog "is an" animal; a dog "has an" ability to swim.

# You cannot instantiate modules (i.e., no object can be created from a module). 
# Modules are used only for namespacing and grouping common methods together.

# good_dog_class.rb

class Animal
    def speak
      "Hello!"
    end
  end
  
  class GoodDog < Animal
    def speak
      super + " from GoodDog class"
    end
  end
  
  class Cat < Animal
  end
  
  sparky = GoodDog.new
  paws = Cat.new
  puts sparky.speak           # => Hello!
  puts paws.speak             # => Hello!

# Using super to initialize

  class Animal
    attr_accessor :name
  
    def initialize(name)
      @name = name
    end
  end
  
  class GoodDog < Animal
    def initialize(color)
      super
      @color = color
    end
  end
  
  bruno = GoodDog.new("brown")        # => #<GoodDog

# Super with an argument

class BadDog < Animal
    def initialize(age, name)
      super(name)
      @age = age
    end
  end
  
  BadDog.new(2, "bear") 

  # Mixin Example

  module Swimmable # Naming convention -> -able as suffix for what module is modeling
    def swim
      "I'm swimming!"
    end
  end
  
  class Animal; end
  
  class Fish < Animal
    include Swimmable         # mixing in Swimmable module
  end
  
  class Mammal < Animal
  end
  
  class Cat < Mammal
  end
  
  class Dog < Mammal
    include Swimmable         # mixing in Swimmable module
  end

  sparky = Dog.new
  neemo  = Fish.new
  paws   = Cat.new
  
  sparky.swim                 # => I'm swimming!
  nemo.swim                  # => I'm swimming!
  paws.swim                   # => NoMethodError: undefined method `swim' for #<Cat:0x007fc453152308>

  ## Mixins and Inheritance

  module Walkable
    def walk
      "I'm walking."
    end
  end
  
  module Swimmable
    def swim
      "I'm swimming."
    end
  end
  
  module Climbable
    def climb
      "I'm climbing."
    end
  end
  
  class Animal
    include Walkable
  
    def speak
      "I'm an animal, and I speak!"
    end
  end

  class GoodDog < Animal
    include Swimmable
    include Climbable
  end
  
  puts "---GoodDog method lookup---"
  puts GoodDog.ancestors

  puts "---Animal method lookup---"
  puts Animal.ancestors

  ### Modules for Namespacing

  module Mammal
    class Dog
      def speak(sound)
        p "#{sound}"
      end
    end
  
    class Cat
      def say_name(name)
        p "#{name}"
      end
    end
  end

  buddy = Mammal::Dog.new
  kitty = Mammal::Cat.new
  buddy.speak('Arf!')           # => "Arf!"
  kitty.say_name('kitty')       # => "kitty"

## Modules as containers

  module Mammal
    ...
  
    def self.some_out_of_place_method(num)
      num ** 2
    end
  end

  value = Mammal.some_out_of_place_method(4) # Can be called directly to the module

# Using "private"

  class GoodDog
    DOG_YEARS = 7
  
    attr_accessor :name, :age
  
    def initialize(n, a)
      self.name = n
      self.age = a
    end
  
    # In summary, private methods are not accessible outside of the class definition at all,
    # and are only accessible from inside the class when called without self

    private # Everything underneath is private
  
    def human_years
      age * DOG_YEARS
    end
  end
  
  sparky = GoodDog.new("Sparky", 4)
  sparky.human_years
