require 'spec_helper'

describe MTG::Card::Rarity do

  before { @r = MTG::Card::Rarity.new('rare') }

  it "should have NAMES" do
    MTG::Card::Rarity::NAMES.should == %w(common uncommon rare mythic\ rare)
  end

  describe "#new" do
    MTG::Card::Rarity::NAMES.each do |name|
      context "when the name is #{name.inspect}" do
        before { @r2 = MTG::Card::Rarity.new(name) }

        it("returns an instance") { @r2.should be_an_instance_of(MTG::Card::Rarity) }
        it("sets the name") { @r2.to_s.should == name }
      end
    end

    context "when the name is something like 'foo'" do
      it "raises an error" do
        lambda { MTG::Card::Rarity.new('foo') }.should raise_error(ArgumentError)
      end
    end
  end

  describe "#<=>" do
    MTG::Card::Rarity::NAMES.each do |name|
      context "when the name is #{name.inspect}" do
        before { @r = MTG::Card::Rarity.new(name) }

        context "when the given rarity's name is #{name.inspect}" do
          before { @r2 = MTG::Card::Rarity.new(name) }

          it("returns 0") { (@r <=> @r2).should eq(0) }
        end

        MTG::Card::Rarity::NAMES.select do |n|
          MTG::Card::Rarity::NAMES.index(n) < MTG::Card::Rarity::NAMES.index(name)
        end.each do |lower_name|
          context "when the given rarity's name is #{lower_name.inspect}" do
            before { @r2 = MTG::Card::Rarity.new(lower_name) }

            it("returns 1") { (@r <=> @r2).should eq(1) }
          end
        end

        MTG::Card::Rarity::NAMES.select do |n|
          MTG::Card::Rarity::NAMES.index(n) > MTG::Card::Rarity::NAMES.index(name)
        end.each do |higher_name|
          context "when the given rarity's name is #{higher_name.inspect}" do
            before { @r2 = MTG::Card::Rarity.new(higher_name) }

            it("returns -1") { (@r <=> @r2).should eq(-1) }
          end
        end
      end
    end
  end

  describe "#eql?" do
    context "when given a rarity" do
      before { @r2 = MTG::Card::Rarity.new('rare') }

      context "when the given rarity is ==" do
        it("returns true") { @r.eql?(@r2).should be_true }
      end

      context "when the given rarity is not ==" do
        before { @r2 = MTG::Card::Rarity.new('common') }

        it("returns false") { @r.eql?(@r2).should be_false }
      end
    end

    context "when given a non-rarity object" do
      it("returns false") { @r.eql?("yo!").should be_false }
    end
  end

  describe "#hash" do
    it "returns the name#hash" do
      @r.hash.should == @r.to_s.hash
    end
  end

  MTG::Card::Rarity::NAMES.each do |name|
    question_method_name = name.gsub(/\s/, '_') + '?'

    describe "##{question_method_name}" do
      context "when the name is #{name.inspect}" do
        before { @r2 = MTG::Card::Rarity.new(name) }
        it("returns true") { @r2.send(question_method_name).should be_true }
      end

      MTG::Card::Rarity::NAMES.select { |n| n != name }.each do |dif_name|
        context "when the name is #{dif_name.inspect}" do
          before { @r2 = MTG::Card::Rarity.new(dif_name) }
          it("returns false") { @r2.send(question_method_name).should be_false }
        end
      end
    end
  end

  describe "#to_s" do
    MTG::Card::Rarity::NAMES.each do |name|
      context "when the rarity is #{name.inspect}" do
        context "when the format is ':short'" do
          before do
            @short_name = case name
              when 'common' then 'C'
              when 'uncommon' then 'U'
              when 'rare' then 'R'
              when 'mythic rare' then 'MR'
            end
          end

          it "returns #{@short_name.inspect}" do
            MTG::Card::Rarity.new(name).to_s(:short).should == @short_name
          end
        end

        context "when the format is not ':short'" do
          it "returns #{name.inspect}" do
            MTG::Card::Rarity.new(name).to_s.should == name
          end
        end
      end
    end
  end

end