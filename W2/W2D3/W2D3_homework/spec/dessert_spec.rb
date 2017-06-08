require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  let(:brownie){ Dessert.new("brownie", 50, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(brownie.type).to eq("brownie")
    end

    it "sets a quantity" do
      expect(brownie.quantity).to eq(50)
    end

    it "starts ingredients as an empty array" do
      expect(brownie.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect {Dessert.new("What", "zero", chef)}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      brownie.add_ingredient("wine")
      expect(brownie.ingredients).to eq(["wine"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ['wine', 'flour', 'sugar','whatever']
      ingredients.each do |ingredient|
        brownie.add_ingredient(ingredient)
      end

      brownie.mix!
      expect(brownie.ingredients).to_not eq(ingredients)
      expect(brownie.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do

    it "subtracts an amount from the quantity" do
      brownie.eat(3)
      expect(brownie.quantity).to eq(47)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { brownie.eat(52) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef")
      expect(brownie.serve).to include("Chef")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(brownie)
      brownie.make_more
    end
  end
end
