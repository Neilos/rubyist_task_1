class Array

  def inject(initial=nil)
    result = initial
    self.each do |element|
      if result; result = yield(result, element)
      else; result = element; end
    end
    result
  end

  def reduce(operator)
      recursive_reduce(operator, 0)
  end

private
  
  def recursive_reduce(operator, i)
    return nil if self.length == 0
    return self[i] if i == self.length - 1
    recursive_reduce(operator, i + 1).send(operator, self[i])
  end

end
