require 'open-uri'

module ArticlesHelper
  def get_articels
    doc = Nokogiri::HTML(open("https://medium.com/search?q=python"))

    collection = doc.css("div.u-paddingTop20")
    res = []
    article_path= 'div:nth-child(1) > div:nth-child(2) > a:nth-child(1) > section:nth-child(1) > div:nth-child(2) > div:nth-child(1)'
    i = 1
    collection.each do |c|
      title = c.css(article_path + " > h3")[0].content.to_s
      link = doc.css('div.u-paddingTop20:nth-child('+i.to_s+') > div:nth-child(1) > div:nth-child(2) > a:nth-child(1)')[0]['href']
      i +=1
      t = {title: title, link: link}      
      res.append(t)
    end

    res
  end
end
