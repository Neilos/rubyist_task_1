class Array

  def inject(initial=nil)
    result = initial
    self.each do |element|
      if result; result = yield(result, element)
      else; result = element; end
    end
    result
  end

  def reduce(operation)
    result = nil
    self.each do |element|
      if result; result = result.send(operation, element)
      else; result = element; end
    end
    result
  end

end
