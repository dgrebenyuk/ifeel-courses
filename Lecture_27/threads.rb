thread = Thread.new { puts 'Hello world' }
thread.join

threads = []
10.times do |i|
  threads << Thread.new { puts i }
end

threads.each(&:join)

puts 'from main thread '

ThreadsWait.all_waits(*threads)
