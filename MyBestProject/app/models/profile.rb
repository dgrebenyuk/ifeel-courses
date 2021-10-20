class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :human, foreign_key: 'user_id', class_name: 'User', optional: true
end
