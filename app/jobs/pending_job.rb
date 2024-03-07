class PendingJob < ApplicationJob
  # queue_as :default

  def perform(name)
    puts "Hello, #{name}! This is a Sidekiq job."
  end
end
