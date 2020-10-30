class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
      def initialize(sender, receiver, amount)
          @sender = sender 
          @receiver = receiver
          @amount = amount
          @status = "pending"
      end
      
      def valid?
         self.sender.valid? && self.receiver.valid?
      end
  
      def execute_transaction
  
        if self.valid? && sender.balance >= amount && status == "pending"
          sender.balance -= amount
          receiver.balance += amount
          @status = "complete"
        else #sender.balance < amount
          @status = "rejected"
          "Transaction rejected. Please check your account balance."
  
        end
  
          # if sender.balance < @amount
          #     @status = "rejected"
          #     print "Transaction rejected. Please check your account balance."
          # else sender.balance >= amount && status == "pending"
          #     @sender.balance -= @amount
          #     @receiver.balance += @amount
          #     @status = "complete"
          # end
  
      end
  
      def reverse_transfer
        if @status == "complete"
          sender.balance += amount
          receiver.balance -= amount
  
          @status = "reversed"
        end
      end
  
      
  
  end