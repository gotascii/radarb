module Radarb
  class Radar
    attr_reader :root

    def initialize(lat = '40.714550', lng='-74.007124')
      @root = Fetch::fetch_xml("#{API}?lat=#{lat}&lng=#{lng}")
    end

    def blips
      @blips ||= @root.find('/radars/radar').to_a
    end

    def stories
      blips.select {|b| b["type"] == 'Story' }
    end

    def tweets
      blips.select {|b| b["type"] == 'Tweet' }
    end
  end
end
