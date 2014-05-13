
describe Topping do
  before :each do
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

  context "#initialize" do
    it "creates a Topping object" do
      pepperoni.should be_an_instance_of Topping
    end
  end

  context "#name" do
    it "should return the name" do
      pepperoni.name.should eq "pepperoni"
    end
  end

  context "#required_bake_time" do
    it "should return the required bake time" do
      pepperoni.required_bake_time.should eq 600
    end
  end

  context "#time_baked" do
    it "should start at 0" do
      mushrooms.time_baked.should eq 0
    end
  end

  context "#bake" do
    it "should increment time_baked" do
      2.times { pepperoni.bake(300) }
      pepperoni.time_baked.should eq 600
    end
  end

  context "#baked" do
    it "should say a baked topping is baked" do
      2.times { mushrooms.bake(300) }
     mushrooms.should be_baked
   end

    it "should and unbaked topping is not baked" do
      anchovies.bake(200)
      anchovies.should_not be_baked
    end
  end



end













