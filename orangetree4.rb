class OrangeGrove
  def initialize(soil_quality)
    @soil_quality = soil_quality
    @grove = []
  end
    def count_all_the_oranges
      all_oranges = 0
      for x in @grove
        all_oranges = all_oranges + x.oranges
      end
      puts "There are #{all_oranges} oranges in the orange grove."
    end

    def soil
      puts "The soil quality rating is #{@soil_quality}."
    end

    def tree_age(sometree)
      for tree in @grove
        if tree.name == sometree.to_s
          tree.age
        end
      end
    end

    def tree_oranges(sometree)
      for tree in @grove
        if tree.name == sometree.to_s
          tree.oranges
        end
      end
    end

    def tree_pick(sometree)
      for tree in @grove
        if tree.name == sometree.to_s
          tree.pickAnOrange
        end
      end
    end

    def all_ages
      for x in @grove
        x.age
      end
    end

    def one_year_passes_grove
      puts "One year has passed."
      for x in @grove
        x.one_year_passes
      end
    end

    def plant(tree_id)
      if @soil_quality >= 7
          @grove << tree_id = OrangeTree.new(tree_id.to_s,0,0,0,"alive", (@soil_quality * 3))
          @soil_quality = @soil_quality - 1
          puts "You planted a new tree!"
      elsif @soil_quality > 4 && @soil_quality < 7
          odds = rand(1..10)
          if odds <= 5
            @grove << tree_id = OrangeTree.new(tree_id.to_s,0,0,0,"alive",(@soil_quality * 3))
            @soil_quality = @soil_quality - 1
            puts "You planted a new tree!"
          else
            @grove << tree_id = OrangeTree.new(tree_id.to_s,0,0,0,"dead", (@soil_quality * 3))
            puts "The tree you tried to plant died due to poor soil quality."
          end
      else
          @grove << tree_id = OrangeTree.new(tree_id.to_s,0,0,0,"dead", (@soil_quality * 3))
          puts "The tree you tried to plant died due to very poor soil quality."
      end
    end

  class OrangeTree
    attr_accessor :name, :height, :age, :oranges, :state, :lifespan
    def initialize(name, height, age, oranges, state, lifespan)
      @name = name
      @height = 0
      @age = 0
      @oranges = 0
      @state = state
      @lifespan = lifespan
    end

    def height
      puts "The tree is #{@height} feet tall."
    end

    def one_year_passes

      if @age == @lifespan
        state = "dead"
        puts "The #{@name} tree has died due to old age."
      else
        @age = @age + 1
        @height = @height + 1
        @oranges = 0
        if @age > 5
          @oranges = @oranges + (@age*5)
        end
      end
    end

    def count_the_oranges
      puts "There are #{@oranges} oranges on the tree."
    end

    def age
      if @state == "alive"
        puts "The #{@name} tree is #{@age} years old."
      else
        puts "The #{@name} tree is dead."
      end
    end

    def pickAnOrange
      if @state == "alive"
        if @oranges == 0
          puts "There are no oranges to pick."
        else
          @oranges = @oranges-1
          puts "What a delicious orange!"
        end
      else
        puts "A dead tree bears no fruit."
      end
    end
  end
end
my_grove = OrangeGrove.new(8)
my_grove.plant(:first)
my_grove.one_year_passes_grove
my_grove.plant(:second)
my_grove.soil
my_grove.one_year_passes_grove
my_grove.count_all_the_oranges
my_grove.one_year_passes_grove
my_grove.all_ages
my_grove.tree_age(:first)
my_grove.tree_pick(:first)
my_grove.tree_oranges(:first)
my_grove.plant(:third)
my_grove.plant(:third)
