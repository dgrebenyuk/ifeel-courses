class UsersExportWorker
  include Sidekiq::Worker

  def perform(*args)
    require 'csv'

    CSV.generate(headers: false) do |csv|
      User.all.each do |user|
        csv << [
          user.id,
          user.first_name,
          user.last_name,
          user.email,
          user.age,
          user.created_at,
          user.updated_at,
          user.status
        ]
      end
    end
  end
end
