def repeater(text, rep)
  raise ArgumentError.new("Rep must be positive Integer") unless rep.respond_to?(:to_i) && rep.to_i>0
  rep.to_i.times do
    p text
  end
end

begin
  repeater "Repeater 1", 5
  repeater "Repeater 2", "5"
  repeater "Repeater 3", "a5"
rescue Exception => e
  puts "Expection handling started"
  p e.message
  p e.backtrace
  puts "Expection handled"
end

p "Application finished"
