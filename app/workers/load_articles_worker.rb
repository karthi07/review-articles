class LoadArticlesWorker
  include Sidekiq::Worker

  def perform
    # logger.info("Fetching articles")
    puts "Fetching articles"
    puts "Articles Loaded"
  end

end