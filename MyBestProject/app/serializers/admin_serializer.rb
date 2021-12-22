class AdminSerializer < BaseSerializer
  attributes :first_name, :last_name, :email, :age

  set_type :user

  has_one :profile
end
