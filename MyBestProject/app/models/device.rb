class Device < ApplicationRecord
  belongs_to :user, optional: true
  scope :tp_links, -> { where(vendor: 'TP-Link') }
end
