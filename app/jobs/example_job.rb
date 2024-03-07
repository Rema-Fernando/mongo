class ExampleJob < ApplicationJob
  queue_as :default
  def perform(user_id)
    user=User.find(user_id)
    puts "User ID: #{user.id}"
    puts "Name: #{user.name}"
    puts "Email: #{user.email}"
    puts "password: #{user.password}"
  end
end