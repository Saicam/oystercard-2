class OysterCard

  def initialize
    @balance = 0
  end

  def top_up(amount)
    @balance += amount
  end
  
  attr_reader :balance
end
