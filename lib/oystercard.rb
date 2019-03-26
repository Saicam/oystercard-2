class OysterCard
    attr_reader :balance, :entry_station

    MAXIMUM_LIMIT = 90
    MINIMUM_BALANCE = 1
  def initialize
    @balance = 0
    @entry_station = nil
  end

  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_LIMIT}exceeded" if @balance + amount > MAXIMUM_LIMIT
    @balance += amount
  end

  def touch_in(station)
    fail "Balance below minimum threshold" if @balance < MINIMUM_BALANCE
    @entry_station = station
  end

  def touch_out(amount = MINIMUM_BALANCE)
    deduct(amount)
    @entry_station = nil
  end

  def in_journey?
     !!entry_station
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
