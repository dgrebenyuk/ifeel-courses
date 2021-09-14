# frozen_string_literal: true

class TestTask
  def first
    10.times do |i|
      10.times do |j|
        [0, 9].include?(i) || [0, 9, i, 9 - i].include?(j) ? print('#') : print(' ')
      end
      puts ''
    end
  end

  def second(string, delimeter = '::')
    result = []
    arr = string.split(delimeter)
    arr.size.downto(1) do |el|
      result << arr.first(el).join(delimeter)
    end
    result
  end

  def third(max = 100)
    sum = (1..max).inject(:+)
    alt_sum = (max / 2.0 * (max + 1)).to_i # alternate solution
    puts "Sum of numbers between 1 and #{max} is #{sum}"
    puts "Sum of numbers between 1 and #{max} is #{alt_sum}"
    sum
  end

  def fourth(array, x)
    array.sort!
    return 'Unsatisfied Array' if array.first > x

    numbers = []
    sum = 0
    array.each do |el|
      return numbers.size, numbers.join(', ') if sum + el > x

      sum += el
      numbers << el
    end
  end
end
