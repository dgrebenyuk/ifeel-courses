# Modules as namespace
module Notification
  class Message
    def self.hello
      p 'I am Notification!'
    end
  end
end

module Warning
  class Message
    def self.hello
      p 'I am Message!'
    end
  end
end

# Module for mixin
module Message
  def self.included(base)
    base.extend(ClassMethods)
  end

  def send_msg
    p "'#{@text}' was sent!"
  end

  module ClassMethods
    def hello
      p 'I am Notification!'
    end
  end
end

class Email
  include Message

  def initialize(text)
    @text = text
  end
end

class SMS
  # extend Message

  def initialize(text)
    @text = text
  end
end
