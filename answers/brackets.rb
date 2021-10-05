# frozen_string_literal: true

class String
  BRACKETS = {
    '{' => '}',
    '[' => ']',
    '(' => ')',
    '<' => '>'
  }.freeze

  def valid_brackets?
    return false if length.odd?

    stack = []

    split('').each do |char|
      if BRACKETS.key?(char)
        stack << char
        next
      end

      return false unless BRACKETS[stack.pop] == char
    end

    stack.empty?
  end
end
