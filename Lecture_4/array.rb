class Array
  def my_each
    i = 0
    while i < size
      yield at(i)
      i += 1
    end
    self
  end

  def my_map(&block)
    i = 0
    while i < size
      res = block.call at(i)
      self[i] = res
      i += 1
    end
    self
  end
end
