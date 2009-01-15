module Radarb
  class Place
    include HappyMapper

    tag 'place'
    element :id, Integer
    element :name, String
    element :url, String
  end
end