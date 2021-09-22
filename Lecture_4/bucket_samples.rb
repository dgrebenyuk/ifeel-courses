def items
  @items
end # eq to attr_reader :items


unless PRICE[name] # what if value for this key is `false` ?


def add_item(item)
  # @items = {}
  if ITEMS_NAME_PRICE.include?(item)
    @items.merge!(ITEMS_NAME_PRICE.reject {|key, value| key != item }) # @items.merge! ITEMS_NAME_PRICE.slice(item)

  else
    puts "Error! You can add only: milk, beer, cola. "
  end

  # return "Error! You can add only: milk, beer, cola. " unless ITEMS_NAME_PRICE.include?(item)

  # @items.merge! ITEMS_NAME_PRICE.slice(item)
end

arr1.concat(arr2) vs arr1 += arr2
arr1.clear vs arr1 = []

def total_sum
  # @items = []
  self.items.each.map{|el| el = PRICES[el]}.sum # each is useless here
end

def total_sum
  sum = 0
  @items.each { |item| sum += PRICE[item] }
  puts "Total sum #{sum} for #{@items.count} items"
end

return self # return is useless
