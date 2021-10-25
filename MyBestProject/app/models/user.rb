# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  first_name :string
#  last_name  :string
#  email      :string
#  age        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  ADULT_AGE = 18
  before_create :set_age

  default_scope -> { order(id: :desc) }
  scope :adults, ->(age_param) { where('age >= ?', age_param).order(age: :desc) }

  has_one :profile, dependent: :destroy
  has_one :expert, class_name: 'Profile'
  has_many :devices, dependent: :nullify
  # has_and_belongs_to_many :groups
  has_many :groups_users
  has_many :groups, through: :groups_users

  validates :email, presence: true, uniqueness: true

  private

  def set_age
    self.age = (16..60).to_a.sample
  end
end