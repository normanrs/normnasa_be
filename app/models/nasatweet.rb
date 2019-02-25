class Nasatweet
  attr_reader :text,
              :url,
              :id
  def initialize(text, url)
    @id = 0
    @text = text
    @url  = url
  end

end
