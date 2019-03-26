require "oystercard.rb"

describe OysterCard do

  let(:station) {double :station}

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

  describe "#in_journey?" do
    it "checks if it in journey" do
      subject.top_up(5)
      subject.touch_in(station)
      expect(subject).to be_in_journey
    end
  end

  describe "#touch_in" do


    it "set in journey" do
      subject.top_up(5)
      subject.touch_in(station)
      expect(subject).to be_in_journey
    end

    it 'raises error when balance is less than £1' do
      expect { subject.touch_in(station) }.to raise_error "Balance below minimum threshold"
    end

    it "remembers stations when touch in" do
      subject.top_up(5)
      subject.touch_in(station)
      expect(subject.entry_station).to eq station
    end
  end

  describe "#touch_out" do
    it "set in journey" do
      subject.touch_out
      expect(subject).not_to be_in_journey
    end

    it "charges the minimum fare on touch in" do
      subject.top_up(5)
      expect {subject.touch_out}.to change{subject.balance}.by(-OysterCard::MINIMUM_BALANCE)
    end
  end
end
