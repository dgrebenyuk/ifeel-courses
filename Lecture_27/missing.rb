class ApiClient
  def method_missing(m, *args, &block)
    if m.to_s.include?('get_')
      puts "Faraday.get #{m.to_s.split('_').last}"
    elsif m.to_s.include?('post_')
      puts "Faraday.post #{m.to_s.split('_').last}, #{args}"
    end
  end
end
