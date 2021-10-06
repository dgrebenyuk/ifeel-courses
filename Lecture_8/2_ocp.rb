# Open Closed Principle
#
# Software entities (classes, modules, functions, etc.) should be open for extension,
# but closed for modification.
#                                  Bertrand Meyer
#

# Bad
module Validations
  MIN_PASS_SIZE = 8
  def validate
    if self.class == User
      case
      when username.size == 0
        raise ArgumentError.new("Name can't be blank")
      when password.size < MIN_PASS_SIZE
        raise ArgumentError.new("Password must be at least 8 characters")
      end
    else
      case
      when text.size == 0
        raise ArgumentError.new("Message can't be blank")
      when text.size > 280
        raise ArgumentError.new("Maximum message size 280 characters")
      end
    end
    self
  end
end

# Good
module Validation
  def validate!(str, min: nil, max: nil)
    param = caller_locations(1,1)[0].label.chop

    raise ArgumentError, "#{param} is blank" if str.nil? || str.empty?
    raise ArgumentError, "#{param} is too short (minimum is #{min} characters)" if min && str.length < min
    raise ArgumentError, "#{param} is too long (maximum is #{max} characters)" if max && str.length > max

    str
  end
end

class User
  MIN_PASSWORD_LENGTH = 8
  include Validation
  attr_reader :password

  def password=(password)
    @password = validate!(password, min: MIN_PASSWORD_LENGTH)
  end
end

# Anti-OCP — Принцип фабрики-фабрик:
# Чрезмерная любовь к OCP ведет к переусложненным решениям с чрезмерным числом уровней абстракции.
