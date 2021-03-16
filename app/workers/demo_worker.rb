class DemoWorker
  include Sidekiq::Worker

  def perform(post_id)
    post = Post.find(post_id)
    post.processed = true
    post.save
  end
end
