module Radarb
  class Tag
    include HappyMapper

    tag 'tag'
    element :name, String
    element :url, String
  end
end