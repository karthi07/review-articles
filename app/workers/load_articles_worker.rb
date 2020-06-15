class LoadArticlesWorker
  include Sidekiq::Worker

  def perform
    # logger.info("Fetching articles")
    puts "Fetching articles"
    puts "Articles Loaded"


    source = "Medium"
    tag = "Python"
    doc = Nokogiri::HTML(open("https://medium.com/search?q=python"))

    collection = doc.css("div.u-paddingTop20")
    res = []
    article_path= 'div:nth-child(1) > div:nth-child(2) > a:nth-child(1) > section:nth-child(1) > div:nth-child(2) > div:nth-child(1)'
    i = 1
    temp_article = Article.new
    collection.each do |c|
      title = c.css(article_path + " > h3")[0].content.to_s
      link = doc.css('div.u-paddingTop20:nth-child('+i.to_s+') > div:nth-child(1) > div:nth-child(2) > a:nth-child(1)')[0]['href']
      i +=1
      t = {title: title, link: link}

      res.append(t)
      # response = firebase.set("articles/a_id-"+i.to_s, t)
      # if response
      #   puts "data pushed"
      # else
      #   puts "errror in saving data"
      # end
    end
    redis = Redis.new
    redis.set "articles", res.to_json
    logger.info("Data Fetched and posted at firebase")
    
  end

end