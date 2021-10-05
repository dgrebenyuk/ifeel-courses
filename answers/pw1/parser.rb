require 'faraday'
require 'csv'

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

class ParseResponse
  attr_accessor :list

  def initialize(list)
    @list = list
  end

  def search
    @list.select { |row| row['City'] =~ /[^^]\s\w+\s\w+$/ } # or row['City'].strip =~ /\s\w+\s/
  end
end
