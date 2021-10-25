# == Schema Information
#
# Table name: groups
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Group < ApplicationRecord
  # has_and_belongs_to_many :users
  has_many :groups_users
  has_many :users, through: :groups_users
end
