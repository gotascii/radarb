module Radarb
  module Fetch
    def self.fetch_url(url)
      Curl::Easy.perform(url).body_str
    end
  end
end