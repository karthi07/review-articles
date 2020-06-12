require 'open-uri'

module ArticlesHelper
  def get_articels
    doc = Nokogiri::HTML(open("https://medium.com/search?q=python"))
    article_headers = doc.xpath('//*[@id="4266"]')[0].to_s
   
  end
end
