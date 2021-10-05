require_relative 'validation'
require_relative 'message'

class User
  MIN_PASSWORD_LENGTH = 8
  include Validation
  attr_reader :username, :password

  def initialize(username, password)
    self.username = username
    self.password = password
  end

  def username=(username)
    @username = validate!(username)
  end

  def password=(password)
    @password = validate!(password, min: MIN_PASSWORD_LENGTH)
  end
end
