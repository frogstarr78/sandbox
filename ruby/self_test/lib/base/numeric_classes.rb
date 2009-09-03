class Integer
  def equal? equal_to, other_message = nil
    message = other_message || "#{self} wasn't equal to #{equal_to}"
    assert_equal self, equal_to, message 
  end
end
