require "oystercard.rb"

describe OysterCard do

  describe "#initialize" do
    it "set a balance of zero when initializing" do
      expect(subject.balance).to eq 0
    end
  end

  describe "#top_up" do
    it "add the given amount to the balance" do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end

    it "raises error if balance exceeds maximum limit" do
      maximum_balance= OysterCard::MAXIMUM_LIMIT
      subject.top_up maximum_balance
      expect{subject.top_up 1 }.to raise_error "Maximum balance of #{maximum_balance}exceeded"
    end
  end

  describe "#deduct" do
    it "deduct the given amount to the balance" do
      expect{ subject.deduct 1 }.to change{ subject.balance }.by -1

    end
  end

  describe "#in_journey?" do
    it "checks if it in journey" do
      subject.touch_in
      expect(subject).to be_in_journey
    end
  end

  describe "#touch_in" do
    it "set in journey" do
      subject.touch_in
      expect(subject).to be_in_journey
    end
  end

  describe "#touch_out" do
    it "set in journey" do
      subject.touch_out
      expect(subject).not_to be_in_journey
    end
  end

end
