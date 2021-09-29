require 'csv'

CSV.foreach('./addresses.csv') do |row|
  p row
end

puts '=============================================='

CSV.foreach('./addresses.csv', headers: true) do |row|
  p row.to_h
  p row.to_h['FirstName']
end

CSV.open('./output.csv', 'w') do |csv|
  csv << (1..10).to_a
end
