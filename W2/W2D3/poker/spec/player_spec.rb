require "rspec"
require "player"

describe Player do
  subject(:tom) { Player.new("Tom") }

  describe "#initialize" do

    it "initialize player with name, hand and pot" do
      expect(tom.name).to eq("Tom")
      expect(tom.hand).to be_empty
      expect(tom.pot).to eq(100)

    end
  end

  # describe "#get_action" do
  #   it "gets input from user for next action: fold,see,or raise" do
  #     expect([:f, :s, :r]).to include(tom.get_action)
  #   end
  # end

end
