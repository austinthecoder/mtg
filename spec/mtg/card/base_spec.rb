require 'spec_helper'

describe MTG::Card::Base do

  before { @b = MTG::Card::Base.new('My Card') }

  describe "#to_s" do
    it("returns the name") { @b.to_s.should == @b.name }
  end

  describe "#set=" do
    before do
      @s = MTG::Set.new('my set')
      MTG::Set.stub!(:new => @s)
    end

    it "sends Set.new with the given name" do
      MTG::Set.should_receive(:new).with('my set')
      @b.set = 'my set'
    end

    it "sets the set" do
      @b.set = 'my set'
      @b.set.should eq(@s)
    end
  end

  describe "#rarity=" do
    before do
      @r = MTG::Card::Rarity.new('rare')
      MTG::Card::Rarity.stub!(:new => @r)
    end

    it "instantiates a rarity with the given name" do
      MTG::Card::Rarity.should_receive(:new).with('rare')
      @b.rarity = 'rare'
    end

    it "sets the rarity" do
      @b.rarity = 'rare'
      @b.rarity.should eq(@r)
    end
  end

  describe "#number=" do
    before { @integerable = Struct.new(:to_i).new(87623) }

    it("sets the number") do
      @b.number = @integerable
      @b.number.should == 87623
    end
  end

end