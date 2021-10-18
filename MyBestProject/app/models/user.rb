class User < ApplicationRecord
  before_create :set_age

  private

  def set_age
    self.age = (16..60).to_a.sample
  end
end
