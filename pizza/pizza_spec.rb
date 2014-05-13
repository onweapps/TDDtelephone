require_relative 'topping_spec'

describe Pizza do

  before :each do
    pizza = Pizza.new({
      name: "name",
      description: "description"
    })
    pepperoni = Topping.new({
      name: "pepperoni",
      required_bake_time: 600,
      time_baked: 0
      })
    mushrooms = Topping.new({
      name: "mushrooms",
      required_bake_time: 480,
      time_baked: 0
      })
    anchovies = Topping.new({
      name: "anchovies",
      required_bake_time: 500,
      time_baked: 0
      })
  end

  context "#new" do
    it "creates a Pizza object" do
      pizza.should be_an_instance_of Pizza
    end
  end

  context "#name" do
    it "should return the name" do
      pizza.name.should eq "name"
    end
  end

  context "#time_baked" do
    it "should start at 0" do
      pizza.time_baked.should eq 0
    end
  end

  context "#description" do
    it "should return a description of the pizza" do
      pizza.description.should eq "description"
    end
  end

  context "#toppings" do
    it "should initially be empty" do
      pizza.toppings.should eq []
    end
  end

  context "#add_toppings" do
    it "should add a topping" do
      pizza.add_toppings(pepperoni)
      pizza.toppings.should eq [pepperoni]
    end

    it "should add several toppings" do
      pizza.add_toppings(mushrooms, anchovies)
      pizza.toppings.should eq [mushrooms, anchovies]
    end
  end

  context "#required_bake_time" do
    it "should give the required bake time for plain pizza" do
      pizza.required_bake_time.should eq 900
    end

    it "should give the required bake time for a pizza with toppings" do
      pizza.add_toppings(pepperoni, mushrooms, anchovies)
      pizza.required_bake_time.should eq 1500
    end
  end

  context "#bake" do
    it "should increment the time_baked for plain pizza" do
      pizza.bake(300)
      pizza.time_baked.should eq 300
    end

    it "should increment the time_baked for a pizza with toppings" do
      pizza.add_toppings(pepperoni, mushrooms, anchovies)
      pizza.bake(300)
      pizza.time_baked.should eq 300
    end

    it "should bake the toppings on a pizza" do
      pizza.add_toppings(pepperoni, mushrooms, anchovies)
      pizza.bake(200)
      pizza.toppings.each do |topping|
        topping.time_baked.should eq 200
      end
    end
  end

  context "#baked?" do
    it "says an unbaked plain pizza is not baked" do
      pizza.should_not be_baked
    end

    it "says a baked plain pizza is baked" do
      pizza.bake(required_bake_time)
      pizza.should be_baked
    end

    it "says an unbaked pizza with toppings is not baked" do
      pizza.add_toppings(pepperoni, mushrooms, anchovies)
      pizza.should_not be_baked
    end

    it "says a baked pizza with toppings is baked" do
      pizza.add_toppings(pepperoni, mushrooms, anchovies)
      pizza.bake(required_bake_time)
      pizza.should be_baked
    end
  end

  context "#finished_toppings" do
    it "says which toppings are finished baking on a plain pizza" do
      pizza.bake(required_bake_time)
      pizza.finished_toppings.should eq []
    end

    it "says which toppings are finished baking on pizza with toppings" do
      pizza.add_toppings(pepperoni, mushrooms, anchovies)
      pizza.bake(1450)
      pizza.finished_toppings.should eq []
    end

    it "says which toppings are finished when only some toppings are finished baking" do
      pizza.add_toppings(pepperoni, mushrooms, anchovies)
      pizza.bake(490)
      pizza.finished_toppings.should eq [pepperoni, anchovies]
    end
  end

  context "#unfinished_toppings" do
    it "says which toppings are not yet baked on a plain pizza" do
      pizza.bake(required_bake_time)
      pizza.unfinished_toppings.should eq []
    end

    it "says which toppings are not yet baked on a pizza with toppings" do
      pizza.add_toppings(pepperoni, mushrooms, anchovies)
      pizza.unfinished_toppings.should eq [pepperoni, mushrooms, anchovies]
    end

    it "says which toppings are unfinished when only some toppings are finished" do
      pizza.add_toppings(pepperoni, mushrooms, anchovies)
      pizza.bake(490)
      pizza.unfinished_toppings.should eq [mushrooms]
    end
  end
end















