class ProfileSerializer < BaseSerializer
  attributes :phone_number
  attribute :year_of_creation do |object|
    object.created_at.strftime('%Y')
  end
end
