require "oystercard.rb"

describe OysterCard do

  describe "#initialize" do
    it "set a balance of zero when initializing" do
      expect(subject.balance).to eq 0
    end
  end

  describe "#top_up" do
    it "add the given amount to the balance" do
      subject.top_up(10)
      expect(subject.balance).to eq 10
    end
  end
end
