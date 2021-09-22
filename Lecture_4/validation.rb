class Name
  # Define default getter methods, but not setter methods.
  attr_reader :first
  # When someone tries to set a first name, enforce rules about it.
  def first=(first)
    if first == nil or first.size == 0
      raise ArgumentError.new('Everyone must have a first name.')
    end
    first = first.dup
    first[0] = first[0].chr.capitalize
    @first = first
  end

  # Delegate to the setter methods instead of setting the instance
  # variables directly.
  def initialize(first)
    self.first = first
  end
end
