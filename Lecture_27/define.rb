def let(name, &block)
  define_method(name) do
    @result ||= block.call if block_given?
  end
end


def let!(name, &block)
  define_method(name) do
    @result ||= block.call if block_given?
  end

  send name
end
