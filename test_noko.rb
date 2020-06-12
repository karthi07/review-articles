require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(URI.open("https://medium.com/search?q=python"))
#article_headers = doc.xpath('//*[@id="4266"]')[0].content.to_s

# article_path = "/html/body/div[1]/div[2]/div/div[3]/div[2]/div[2]/div[1]/div/div/div[1]/div/div[2]/a/section/div[2]/div"
# article_headers = doc.xpath(article_path)[0].content.to_s


# collection = doc.xpath("//div[contains(@class, 'js-postListHandle')]")[0].content.to_s
collection = doc.css("div.u-paddingTop20")

res = []
article_path= 'div:nth-child(1) > div:nth-child(2) > a:nth-child(1) > section:nth-child(1) > div:nth-child(2) > div:nth-child(1)'
# div.u-paddingTop20:nth-child(1) > div:nth-child(1) > div:nth-child(2) > a:nth-child(1)
# div.u-paddingTop20:nth-child(1) > div:nth-child(1) > div:nth-child(2) > a:nth-child(1)
#div.u-paddingTop20:nth-child(2) > div:nth-child(1) > div:nth-child(2) > a:nth-child(1)
# div.u-paddingTop20:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > a:nth-child(2)
i = 1
collection.each do |c|
  title = "title"
  # title = c.css(article_path + " > h3")[0].content.to_s
  
  # desc = c.css(article_path + " > h4")[0].content.to_s
  title = c.css(article_path + " > h3")[0].content.to_s
  # desc = c.css(article_path )[0].content.to_s

  #working
  link = doc.css('div.u-paddingTop20:nth-child('+i.to_s+') > div:nth-child(1) > div:nth-child(2) > a:nth-child(1)')[0]['href']
  i +=1
  # link = "li"
  
  # div.u-paddingTop20:nth-child(8) > div:nth-child(1) > div:nth-child(2) > a:nth-child(1) > section:nth-child(1) > div:nth-child(2) > div:nth-child(1) > h3:nth-child(2)
  # div.u-paddingTop20:nth-child(8) > div:nth-child(1) > div:nth-child(2) > a:nth-child(1) > section:nth-child(1) > div:nth-child(2) > div:nth-child(1) > h4:nth-child(3)
  # desc = "hello"
  res.append(title+ " -> " + link)
end

puts res
