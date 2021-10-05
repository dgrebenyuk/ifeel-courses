module Validation
  def validate!(str, min: nil, max: nil)
    param = caller_locations(1,1)[0].label.chop

    raise ArgumentError, "#{param} is blank" if str.nil? || str.empty?
    raise ArgumentError, "#{param} is too short (minimum is #{min} characters)" if min && str.length < min
    raise ArgumentError, "#{param} is too long (maximum is #{max} characters)" if max && str.length > max

    str
  end
end
