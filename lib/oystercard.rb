class OysterCard
MAXIMUM_LIMIT = 90
  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_LIMIT}exceeded" if @balance + amount > MAXIMUM_LIMIT
    @balance += amount
  end

  attr_reader :balance
end
