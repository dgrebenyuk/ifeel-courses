# == Schema Information
#
# Table name: devices
#
#  id         :bigint           not null, primary key
#  address    :string
#  vendor     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
class Device < ApplicationRecord
  belongs_to :user, optional: true
  scope :tp_links, -> { where(vendor: 'TP-Link') }

  # validates :address, uniqueness: true
  validates :address, uniqueness: { scope: :user }

  enum device_status: { online: 0, offline: 1, loading: 2 }
end
