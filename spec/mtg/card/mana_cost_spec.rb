require 'spec_helper'

VALID_MANA_COST_STRINGS = [
  [nil, 0],
  ['', 0],
  ['0', 0],
  ['X', 0],
  ['XX', 0],
  ['X1', 1],
  ['XX1', 1],
  ['X12', 12],
  ['XX12', 12],
  ['XGUB', 3],
  ['XX12UBW', 15]
]

INVALID_MANA_COST_STRINGS = [
  '01',
  'X01',
  'X01GU',
  'GU1',
  'UX',
  'BX',
  '10X'
]

describe MTG::Card::ManaCost do

  describe ".new" do
    VALID_MANA_COST_STRINGS.each do |str, x|
      context "with #{str.inspect}" do
        before { @str = str }
        it "does not raise an error" do
          lambda { MTG::Card::ManaCost.new(@str) }.should_not raise_error
        end
      end
    end

    INVALID_MANA_COST_STRINGS.each do |str|
      context "with #{str.inspect}" do
        before { @str = str }
        it "does raises an argument error" do
          lambda { MTG::Card::ManaCost.new(@str) }.should raise_error(ArgumentError)
        end
      end
    end
  end

  ##################################################

  describe "#converted" do
    VALID_MANA_COST_STRINGS.each do |str, conv_cost|
      context "with #{str.inspect}" do
        before { @mc = MTG::Card::ManaCost.new(str) }

        it("returns #{conv_cost.inspect}") { @mc.converted.should == conv_cost }
      end
    end
  end

  describe "#to_s" do
    str = VALID_MANA_COST_STRINGS[0][0]
    context "with #{str.inspect}" do
      before { @mc = MTG::Card::ManaCost.new(str) }
      it("returns #{str.to_s.inspect}") { @mc.to_s.should == str.to_s }
    end
  end

  # describe "#<=>" do
  #   context "when the other is a non MTG::Card::ManaCost" do
  #     before { @other = nil }
  #     it("raises an error") do
  #       lambda do
  #         MTG::Card::ManaCost.new <=> @other
  #       end.should raise_error(ArgumentError, "cannot compare with #{@other.inspect}")
  #     end
  #   end
  # end

end