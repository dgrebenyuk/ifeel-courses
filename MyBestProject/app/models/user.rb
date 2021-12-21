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
#  status     :integer          default("normal")
#
class User < ApplicationRecord
  ADULT_AGE = 18
  before_create :set_age
  after_create :send_email

  default_scope -> { order(id: :desc) }
  scope :adults, ->(age_param) { where('age >= ?', age_param).order(age: :desc) }

  has_one :profile, dependent: :destroy
  has_one :expert, class_name: 'Profile'
  has_many :devices, dependent: :nullify
  # has_and_belongs_to_many :groups
  has_many :groups_users
  has_many :groups, through: :groups_users

  validates :email, presence: true, uniqueness: true

  enum status: { normal: 0, premium: 1, gold: 2 }
  accepts_nested_attributes_for :profile
  accepts_nested_attributes_for :devices, allow_destroy: true

  delegate :phone_number, to: :profile, allow_nil: true #, prefix: true
  # delegate :city, to: :profile, allow_nil: true

  private

  def set_age
    self.age = (16..60).to_a.sample
  end

  def send_email
    UserMailer.with(user_id: id).welcome_user.deliver_later
  end
end
