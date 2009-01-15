module Radarb
  class Radar
    include HappyMapper

    tag 'radar'
    element :item_id, Integer
    element :icon_path, String
    element :author, String
    element :author_url, String
    element :published_at, DateTime
    element :title, String
    element :body, String
    element :url, String
    element :image_url, String
    attribute :type, String

    def self.scan(lat = '40.755970', lng='-73.986702')
      url = "#{API}?lat=#{lat}&lng=#{lng}"
      xml = Fetch::fetch_url(url)
      parse(xml).extend(Collectable)
    end
  end
end
