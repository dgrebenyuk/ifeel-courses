every 1.day, at: '4:30 am' do
  rake 'users:reset_devices_count'
end
