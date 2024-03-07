class FailingJob
  include Sidekiq::Worker

  def perform(*args)
    # Simulating a failure by raising an exception
    raise StandardError, "This job has failed intentionally!"
  end
end