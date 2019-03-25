require "oystercard.rb"

describe OysterCard do

  describe "#initialize" do
    it "set a balance of zero when initializing" do
      expect(subject.balance).to eq 0
    end
  end

end
