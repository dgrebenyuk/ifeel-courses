class Message
  MAX_TEXT_LENGTH = 280
  include Validation
  attr_reader :text

  def initialize(text)
    self.text = text
  end

  def text=(text)
    @text = validate!(text, max: MAX_TEXT_LENGTH)
  end
end
