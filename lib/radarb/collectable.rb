module Radarb
  module Collectable
    def tweets
      find_by_type('Tweet')
    end

    def stories
      find_by_type('Story')
    end

    def find_by_type(type)
      select{|item| item.type == type }
    end
  end
end