module GravatarHelper
  def avatar_url(_email)
    'https://via.placeholder.com/48'
  end

  def avatar_url_old(email)
    if gravatar?(email)
      gravatar = Digest::MD5.hexdigest(email).downcase
      "http://gravatar.com/avatar/#{gravatar}.png?s=48"
    else
      'https://via.placeholder.com/48'
    end
  end

  def gravatar?(email)
    gravatar = Digest::MD5.hexdigest(email).downcase
    gravatar_check = "http://gravatar.com/avatar/#{gravatar}.png?d=404"
    uri = URI.parse(gravatar_check)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    response.code.to_i != 404
  end
end
