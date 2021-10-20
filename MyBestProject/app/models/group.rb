class Group < ApplicationRecord
  # has_and_belongs_to_many :users
  has_many :groups_users
  has_many :users, through: :groups_users
end
