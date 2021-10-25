# == Schema Information
#
# Table name: groups_users
#
#  user_id  :bigint           not null
#  group_id :bigint           not null
#
class GroupsUser < ApplicationRecord
  belongs_to :group
  belongs_to :user
end
