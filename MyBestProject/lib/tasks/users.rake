namespace :users do
  desc 'Reset users devices counter cache'
  task reset_devices_count: :environment do
    User.all.each do |user|
      User.reset_counters(user.id, :devices_count)
    end
  end
end
