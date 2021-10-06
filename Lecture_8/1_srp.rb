# Single Responsibility Principle
#
# A class should have only one reason to change.
#                               Robert C. Martin
#


# Bad single responsibility example

class CSVParser
  def self.parse_from(url)
    resp = Faraday.get url
    File.open('cities.csv', 'w') { |f| f.write resp.body }

    list = []
    CSV.foreach('./cities.csv', headers: true) do |row|
      list << row.to_h
    end

    ParseResponse.new(list)
  end
end

# Good

class CSVDownloader
  def self.get_from(url)
    resp = Faraday.get url
    File.open('cities.csv', 'w') { |f| f.write resp.body }
  end
end

class CSVParser
  def self.parse(path)
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << row.to_h
    end

    ParseResponse.new(list)
  end
end

# Anti-SRP — Принцип размытой ответственности.
# Чрезмерная любовь к SRP ведет к обилию мелких классов/методов и размазыванию логики между ними.
