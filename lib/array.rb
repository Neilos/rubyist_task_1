class Array

  def inject(initial=nil, &block) 
    recursive_inject(initial || self[0], initial ? 0 : 1, &block)
  end

  def reduce(operator)
    recursive_reduce(operator, 0)
  end

private
  
  def recursive_inject(result, index, &block)
    return result if index == count 
    recursive_inject(block.call(result, self[index]), index + 1, &block)
  end

  def recursive_reduce(operator, index)
    return self[index] if index >= count - 1
    recursive_reduce(operator, index + 1).send(operator, self[index])
  end

end
