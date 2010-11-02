require 'spec_helper'

class NameableObject
  include MTG::Nameable
end

describe NameableObject do

  before { @no = NameableObject.new }

  describe "#name=" do
    it "checks the name" do
      @no.should_receive(:check_name!).with("foo")
      @no.name = "foo"
    end

    context "when the name is #{"whatever".inspect}" do
      it "sets the name" do
        @no.name = "whatever"
        @no.name.should == "whatever"
      end
    end
  end

  describe "#to_s" do
    context "when the name is \"foo\"" do
      before { @no.name = "foo" }

      it("returns the \"foo\"") { @no.to_s.should == "foo" }
    end
  end

end