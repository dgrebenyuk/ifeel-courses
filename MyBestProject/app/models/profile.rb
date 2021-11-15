# == Schema Information
#
# Table name: profiles
#
#  id           :bigint           not null, primary key
#  phone_number :string
#  user_id      :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  address      :string
#
class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :human, foreign_key: 'user_id', class_name: 'User', optional: true
end
