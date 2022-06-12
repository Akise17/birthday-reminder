class Birthday::HookbinJob
  include Sidekiq::Job

  def perform(message)
    External.hookbin.call(message)
  end
end
