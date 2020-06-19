# require 'open-uri'

module ArticlesHelper
  def add(a,b)
    return a+b
  end
end

# module ArticlesHelper
#   def get_articels
#     source = 'Medium'
#     tag = 'Python'
#     doc = Nokogiri::HTML(open('https://medium.com/search?q=python'))

#     collection = doc.css('div.u-paddingTop20')
#     res = []
#     article_path = 'div:nth-child(1) > div:nth-child(2) > a:nth-child(1) \
# > section:nth-child(1) > div:nth-child(2) > div:nth-child(1)'
#     i = 1
#     temp_article = Article.new
#     collection.each do |c|
#       title = c.css(article_path + ' > h3')[0].content.to_s
#       link = doc.css('div.u-paddingTop20:nth-child(' + i.to_s + ') > \
# div:nth-child(1) > div:nth-child(2) > a:nth-child(1)')[0]['href']
#       i += 1
#       t = { title: title, link: link }
#       res.append(t)
#       temp_article = Article.new(title: title, desc: '', source: source, tag: tag, link: link)

#       temp_article.save if temp_article.valid?
#     end

#     res
#   end

#   def push_articles
#     # firebase setup
#     # base_uri  = 'https://review-articles-a8013.firebaseio.com/'
#     # private_key_json_string = File.open('api-key.json').read
#     # firebase = Firebase::Client.new(base_uri, private_key_json_string)

#     source = 'Medium'
#     tag = 'Python'
#     doc = Nokogiri::HTML(open('https://medium.com/search?q=python'))

#     collection = doc.css('div.u-paddingTop20')
#     res = []
#     article_path = 'div:nth-child(1) > div:nth-child(2) > a:nth-child(1) \
# > section:nth-child(1) > div:nth-child(2) > div:nth-child(1)'
#     i = 1
#     temp_article = Article.new
#     collection.each do |c|
#       title = c.css(article_path + ' > h3')[0].content.to_s
#       link = doc.css('div.u-paddingTop20:nth-child(' + i.to_s + ') > \
# div:nth-child(1) > div:nth-child(2) > a:nth-child(1)')[0]['href']
#       i += 1
#       t = { title: title, link: link }

#       response = firebase.set('articles/a_id-' + i.to_s, t)
#       if response
#         puts 'data pushed'
#       else
#         puts 'errror in saving data'
#       end
#     end
#     'Data Fetched and posted at firebase'
#   end
# end
