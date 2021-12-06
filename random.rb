# Full answer: 3 points
# Partial answer: 2 points
# Addition to someone's answer: 1 point

students = {
  'Андрей' => 0,
  'Антон' => 0,
  'Костя' => 0,
  'Оля' => 0
}

File.open('./questions.txt', 'r') do |f|
  f.each_line do |line|
    puts line
    students.keys.shuffle.each do |name|
      puts name
      res = gets.chomp
      students[name] += res.to_i
    end
    puts '--------------------'
    puts students
    puts ''
  end
end
