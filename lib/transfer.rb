require 'pry'
class Transfer
  # your code here
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
     sender.valid? && receiver.valid?

  end

  def execute_transaction
    if valid? && self.sender.balance > amount && self.status == "pending"
      self.sender.balance -= amount
      self.receiver.balance += amount
      self.status = "complete"
    else
      reject_transfer
    end
  end

  def reject_transfer
      self.status = "rejected"
     "Transaction rejected. Please check your account balance."
  end

#=> #<Transfer:0x00007f94d3398428
# @amount=50,
# @receiver=#<BankAccount:0x00007f94d3398478 @balance=1050, @name="Avi", @status="open">,
# @sender=#<BankAccount:0x00007f94d3398518 @balance=950, @name="Amanda", @status="open">,
# @status="complete">

  def reverse_transfer
  #binding.pry
  if valid? && self.receiver.balance > amount && self.status == "complete"
    self.sender.balance += amount
    self.receiver.balance -= amount
    self.status = "reversed"
  else
    reject_transfer
  end
  end



end
